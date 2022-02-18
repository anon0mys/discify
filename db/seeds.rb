File.foreach(Rails.root.join('lib', 'seeds', 'course_data.json')) do |line|
  course_data = JSON.parse(line)
  course = Course.create!(course_data)
end

puts "Seeded #{Course.count} courses, #{Layout.count} layouts, and #{Hole.count} holes"

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
