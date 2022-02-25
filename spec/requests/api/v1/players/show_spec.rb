require 'rails_helper'

describe 'GET /api/v1/players/:id' do
  let(:player) { create(:player, name: 'Test') }
  before {
    create_list(:complete_player_round, 3, player: player, total_score: 53)
  }
  before { get api_v1_player_path(player.id) }

  it 'should return a player' do
    player = JSON.parse(response.body)

    expect(player['id']).to eq 1
    expect(player['name']).to eq 'Test'
    expect(player['average_score']).to eq -1
    expect(player['rounds_played']).to eq 3
  end
end