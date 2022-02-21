require 'rails_helper'

describe 'DELETE /api/v1/players/:id' do
  context 'with a valid id' do
    let(:player) { create(:player) }
    before { delete api_v1_player_path(player.id) }

    it 'responds with a 202' do
      expect(response).to have_http_status(:accepted)
    end
  end

  context 'with an invalid id' do
    before { delete api_v1_player_path(2) }

    it 'responds with an errors key' do
      data = JSON.parse(response.body)
      expect(data['errors']).to eq "Couldn't find Player with 'id'=2"
    end

    it 'responds with a 404' do
      expect(response).to have_http_status(:not_found)
    end
  end
end