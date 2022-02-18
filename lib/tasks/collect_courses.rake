desc 'Create a json file of course data'
task :collect_courses do
  base_url = 'https://udisc.com'
  courses_file = File.open(Rails.root.join('lib', 'seeds', 'course_data.json'), 'w')

  browser = Watir::Browser.new

  response = browser.goto(base_url + '/courses?latitude=39.7828572&longitude=-104.8627855&searchRadius=50&zoom=9.321746')
  js_doc = browser.element(css: '#course-list').wait_until(&:present?)
  next_button = js_doc.children[3].children[3].children[1].children[2]
  paths = []
  
  doc = Nokogiri::HTML5(js_doc.inner_html)
  paths += doc.xpath('//div/a/@href').map(&:value)

  until next_button.disabled?
    next_button.click
    doc = Nokogiri::HTML5(js_doc.inner_html)
    paths += doc.xpath('//div/a/@href').map(&:value)
  end

  paths.each do |path|
    course = {}
    response = browser.goto(base_url + path)
    sleep(2)
    js_doc = browser.div(css: '.MuiGrid-container')
    doc = Nokogiri::HTML5(js_doc.inner_html)
    data = doc.css('.MuiGrid-item')
    course[:name] = data.css('h1').text
    rating, _ = data.css('.items-center').first.children.map(&:text)
    course[:rating] = rating.to_f
    course_data = data.css('p').map(&:text)[0..15]
    city, state = course_data[0].split(', ')
    course[:city] = city
    course[:state] = state
    course[:description] = course_data[1]
    course[:holes] = course_data[3].to_i
    course[:availability] = course_data[5]
    course[:tees] = course_data[7]
    course[:targets] = course_data[9]
    course[:property] = course_data[11]
    course[:services] = course_data[13]
    course[:established] = course_data[15]

    course[:layouts_attributes] = data.css('.MuiAccordion-root').map do |layout_data|
      expand_button = layout_data.css('.MuiAccordionSummary-expandIcon').first
      expand_button['class'] = expand_button['class'] << " Mui-expanded"
      layout = {}
      summary_info = layout_data.css('.MuiAccordionSummary-content').children.children.map(&:text)
      holes, par, distance = summary_info[1].split('·')
      layout[:name] = summary_info[0]
      layout[:description] = summary_info[3]
      layout[:total_par] = par&.split(' ')&.last&.to_i
      layout[:total_distance] = distance&.split(' ')&.first&.to_i

      layout[:holes_attributes] = layout_data.css('.MuiAccordionDetails-root').children.children.children.map do |nine_holes|
        nine_holes.children[1].children.map do |hole|
          hole_number, distance, par = hole.children.map(&:text)
          if hole_number.to_i > 0
            {hole_number: hole_number.to_i, distance: distance.to_i, par: par.to_i}
          end
        end
      end.flatten.compact
      layout
    end
    courses_file.puts course.to_json
  end
end