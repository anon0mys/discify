require 'rails_helper'

describe 'POST /api/v1/rounds' do
  let(:course) { create(:full_course) }
  before { create_list(:player, 3) }
  let(:attrs) {{
    round: {
      course_id: course.id,
      layout_id: course.layouts.first.id,
      player_ids: [1, 2, 3]
    }
  }}

  context 'with valid attrs' do
    before { post api_v1_rounds_path, params: attrs }

    it 'creates a round' do
      round = JSON.parse(response.body)

      expect(round['id']).to eq 1
      expect(round['course_name']).to eq course.name
      expect(round['layout_name']).to eq course.layouts.first.name
      expect(round['date']).to eq Time.current.strftime('%m/%d/%Y')
      expect(round['holes'].count).to eq course.layouts.first.holes.count
    end

    it 'responds with a 201' do
      expect(response).to have_http_status(:created)
    end
  end

  context 'with invalid attrs' do
    it 'returns an validation error when course doesnt exist' do
      attrs[:round][:course_id] = 99999
      post api_v1_rounds_path, params: attrs
      data = JSON.parse(response.body)
      expect(data['errors']).to eq 'Validation failed: Course must exist'
    end

    it 'returns an validation error when layout doesnt exist' do
      attrs[:round][:layout_id] = 99999
      post api_v1_rounds_path, params: attrs
      data = JSON.parse(response.body)
      expect(data['errors']).to eq 'Validation failed: Layout must exist'
    end

    it 'returns an validation error when player doesnt exist' do
      attrs[:round][:player_ids] = [999]
      post api_v1_rounds_path, params: attrs
      data = JSON.parse(response.body)
      expect(data['errors']).to eq 'Validation failed: Player must exist'
    end

    it 'responds with a 422' do
      post api_v1_rounds_path, params: attrs[:round][:course_id] = nil
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end