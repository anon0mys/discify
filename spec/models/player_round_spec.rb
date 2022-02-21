require 'rails_helper'

RSpec.describe PlayerRound, type: :model do
  context 'validations' do
    it { should validate_presence_of :total_score }
  end

  context 'relationships' do
    it { should belong_to :player }
    it { should belong_to :round }
    it { should have_many :scores }
  end

  context '#score_round' do
    let(:player_round) { create(:player_round) }
    before { create_list(:score, 3, player_round: player_round) }

    it 'should sum scores' do
      expect(player_round.total_score).to eq 0

      player_round.score_round

      expect(player_round.total_score).to eq Score.all.sum(:strokes)
    end
  end
end
