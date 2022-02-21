require 'rails_helper'

describe 'POST /api/v1/rounds/:id/score_hole' do
  let(:course) { create(:full_course) }
  before { create_list(:player, 3) }

  context 'with valid attrs' do
    let(:round) { 
      RoundManager.new.start_round(
      course_id: course.id,
      layout_id: course.layouts.first.id,
      player_ids: Player.all.pluck(:id)
      ).round }
    let(:first_hole) { round.layout.holes.first }
    let(:valid_attrs) {{ 
      hole: {
        hole_number: first_hole.hole_number,
        player_scores: [
          {player_id: 1, strokes: first_hole.par},
          {player_id: 2, strokes: first_hole.par - 1},
          {player_id: 3, strokes: first_hole.par + 2}
        ]
      }
    }}
    before { post api_v1_round_score_hole_path(round.id), params: valid_attrs }

    it 'should score a hole' do
      hole_data = JSON.parse(response.body)

      expect(hole_data['hole_number']).to eq first_hole.hole_number
      expect(hole_data['scores'].count).to eq 3
    end

    it 'should order by score' do
      round_data = JSON.parse(response.body)

      scores = round_data['scores']
      expect(scores[0]['score']).to eq -1
      expect(scores[1]['score']).to eq 0
      expect(scores[2]['score']).to eq 2
    end

    it 'should return number of strokes' do
      round_data = JSON.parse(response.body)

      scores = round_data['scores']
      expect(scores[0]['strokes']).to eq first_hole.par - 1
      expect(scores[1]['strokes']).to eq first_hole.par
      expect(scores[2]['strokes']).to eq first_hole.par + 2
    end

    it 'should return a 200 status' do
      expect(response).to have_http_status(:ok)
    end
  end
end