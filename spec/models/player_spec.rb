require 'rails_helper'

RSpec.describe Player, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
  end

  context 'relationships' do
    it { should have_many :player_rounds }
  end
end
