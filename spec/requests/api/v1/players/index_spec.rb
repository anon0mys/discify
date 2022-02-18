require 'rails_helper'

describe 'GET /api/v1/players' do
  context 'with no filters' do
    before { create(:player, name: 'Test') }
    before { create_list(:player, 2) }
    before { get api_v1_players_path }

    it 'should return a list of players' do
      data = JSON.parse(response.body)
      expect(data.count).to eq 3
    end

    it 'should serialize players' do
      data = JSON.parse(response.body)
      player = data[0]

      expect(player['id']).to eq 1
      expect(player['name']).to eq 'Test'
    end
  end
end