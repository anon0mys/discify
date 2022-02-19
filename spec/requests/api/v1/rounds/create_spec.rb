require 'rails_helper'

describe 'POST /api/v1/rounds' do
  let(:course) { create(:full_course) }
  before { create_list(:player, 3) }
  let(:valid_attrs) {{
    round: {
      course_id: course.id,
      layout_id: course.layouts.first.id,
      player_ids: [1, 2, 3]
    }
  }}

  context 'with valid attrs' do
    before { post api_v1_rounds_path, params: valid_attrs }

    it 'creates a round' do
      round = JSON.parse(response.body)

      expect(round['id']).to eq 1
      expect(round['course_name']).to eq course.name
      expect(round['layout_name']).to eq course.layouts.first.name
      expect(round['date']).to eq Date.today.strftime('%m/%d/%Y')
      expect(round['holes'].count).to eq course.layouts.first.holes.count
      require 'pry'; binding.pry()
    end

    it 'responds with a 201' do
      expect(response).to have_http_status(:created)
    end
  end
end