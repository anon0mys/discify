require 'rails_helper'

RSpec.describe Score, type: :model do
  context 'validations' do
    it { should validate_presence_of :score }
  end

  context 'relationships' do
    it { should belong_to :player_round }
    it { should belong_to :hole }
  end
end
