require 'rails_helper'

describe 'POST /api/v1/rounds/:id/end_round' do
  let(:course) { create(:full_course) }
  before { create_list(:player, 3) }

  context 'with valid attrs' do
    let(:round) { 
      RoundManager.new.start_round(
      course_id: course.id,
      layout_id: course.layouts.first.id,
      player_ids: Player.all.pluck(:id)
      ).round }
    let(:valid_attrs) {{ 
      round: {
        player_scores: [
          {player_id: 1, total_score: 58},
          {player_id: 2, total_score: 56},
          {player_id: 3, total_score: 59}
        ]
      }
    }}
    before { post api_v1_round_end_round_path(round.id), params: valid_attrs }

    it 'should end a round' do
      round_data = JSON.parse(response.body)

      expect(round_data['id']).to eq round.id
      expect(round_data['course_name']).to eq course.name
      expect(round_data['layout_name']).to eq course.layouts.first.name
      expect(round_data['date']).to eq Time.current.strftime('%m/%d/%Y')
    end

    it 'should order by total score' do
      round_data = JSON.parse(response.body)

      scores = round_data['scores']
      expect(scores[0]['total_score']).to eq 56
      expect(scores[1]['total_score']).to eq 58
      expect(scores[2]['total_score']).to eq 59
    end

    it 'should calculate scores' do
      round_data = JSON.parse(response.body)

      scores = round_data['scores']
      expect(scores[0]['score']).to eq -2
      expect(scores[1]['score']).to eq 0
      expect(scores[2]['score']).to eq 1
    end

    it 'should return a 200 status' do
      expect(response).to have_http_status(:ok)
    end
  end
end