require 'rails_helper'

describe 'GET /api/v1/courses/:id' do
  let(:course) { create(:full_course) }
  before { get api_v1_course_path(course.id) }

  it 'should return a course and its layouts' do
    course = JSON.parse(response.body)

    expect(course['id']).to eq 1
    expect(course['name']).to eq 'Village Greens'
    expect(course['description']).to eq nil
    expect(course['city']).to eq 'Greenwood Village'
    expect(course['state']).to eq 'CO'
    expect(course['location']).to eq '(-104.878147,39.637633)/-104.878147,39.637633,12/'
    expect(course['rating']).to eq 4.0
    expect(course['holes']).to eq 9
    expect(course['availability']).to eq 'Year Round'
    expect(course['tees']).to eq 'Concrete'
    expect(course['targets']).to eq 'Mach V'
    expect(course['property']).to eq 'Public Park'
    expect(course['services']).to eq 'Dogs Allowed, Restrooms Available'
    expect(course['established']).to eq '2013'

    layouts = course['layouts']
    expect(layouts.count).to eq 2
    expect(layouts[0]['holes'].count).to eq 18
    expect(layouts[1]['holes'].count).to eq 9
  end
end