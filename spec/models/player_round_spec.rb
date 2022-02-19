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
end
