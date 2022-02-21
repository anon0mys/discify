require 'rails_helper'

describe 'GET /api/v1/rounds/:id' do
  let(:course) { create(:full_course) }
  before { create_list(:player, 3) }

  let(:round) {
    RoundManager.new.start_round(
    course_id: course.id,
    layout_id: course.layouts.first.id,
    player_ids: Player.all.pluck(:id)
    ).round 
  }
  let(:valid_attrs) {{
    round: {
      player_scores: [
        {player_id: 1, total_score: 58},
        {player_id: 2, total_score: 56},
        {player_id: 3, total_score: 59}
      ]
    }
  }}
  before { get api_v1_round_path(round.id) }

  it 'returns a round' do
    round = JSON.parse(response.body)

    expect(round['id']).to eq 1
    expect(round['course_name']).to eq course.name
    expect(round['layout_name']).to eq course.layouts.first.name
    expect(round['date']).to eq Time.current.strftime('%m/%d/%Y')
    expect(round['holes'].count).to eq course.layouts.first.holes.count
  end

  it 'responds with a 200' do
    expect(response).to have_http_status(:ok)
  end
end