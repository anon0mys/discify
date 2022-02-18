require 'rails_helper'

describe 'GET /api/v1/courses' do
  context 'with no filter' do
    before { get api_v1_courses_path }

    it 'should return a list of courses' do
      data = JSON.parse(response.body)
      expect(data.count).to be 1
    end
  end
end