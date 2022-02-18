require 'rails_helper'

describe 'GET /api/v1/courses' do
  context 'with no filter' do
    before { create_list(:course, 3) }
    before { get api_v1_courses_path }

    it 'should return a list of courses' do
      data = JSON.parse(response.body)
      expect(data.count).to eq 3
    end

    it 'should serialize the courses' do
      data = JSON.parse(response.body)
      course = data[0]

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
      expect(course['layouts']).to be nil
    end
  end

  context 'with filters' do
    before { create_list(:course, 3, rating: 3.9) }

    it 'should fuzzy search by name' do
      create(:course, name: 'Searchable')

      get api_v1_courses_path + '?name=search'
      data = JSON.parse(response.body)

      expect(data.count).to eq 1
    end

    it 'should fuzzy search by city' do
      create(:course, city: 'Somewhere Else')

      get api_v1_courses_path + '?city=somewhere'
      data = JSON.parse(response.body)

      expect(data.count).to eq 1
    end

    it 'should search by state' do
      create(:course, state: 'OR')

      get api_v1_courses_path + '?state=OR'
      data = JSON.parse(response.body)

      expect(data.count).to eq 1
    end

    it 'should search by minimum rating' do
      create(:course, rating: 4.5)

      get api_v1_courses_path + '?rating_min=4'
      data = JSON.parse(response.body)

      expect(data.count).to eq 1
    end

    it 'should search by minimum holes' do
      create(:course, holes: 18)

      get api_v1_courses_path + '?holes_min=18'
      data = JSON.parse(response.body)

      expect(data.count).to eq 1
    end
  end
end