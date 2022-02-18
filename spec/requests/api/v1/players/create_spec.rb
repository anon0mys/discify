require 'rails_helper'

describe 'POST /api/v1/players' do
  let(:valid_attrs) {{
    player: {name: 'Test'}
  }}

  context 'with valid attrs' do
    before { post api_v1_players_path, params: valid_attrs }

    it 'creates a player' do
      player = JSON.parse(response.body)
      expect(player['id']).to eq 1
      expect(player['name']).to eq 'Test'
    end

    it 'responds with a 201' do
      expect(response).to have_http_status(:created)
    end
  end
end