require 'rails_helper'

describe 'GET /api/v1/courses/:id' do
  let(:player) { create(:player, name: 'Test') }
  before { get api_v1_player_path(player.id) }

  it 'should return a player' do
    player = JSON.parse(response.body)

    expect(player['id']).to eq 1
    expect(player['name']).to eq 'Test'
  end
end