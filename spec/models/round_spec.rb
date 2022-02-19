require 'rails_helper'

RSpec.describe Round, type: :model do
  context 'relationships' do
    it { should belong_to :course }
    it { should belong_to :layout }
    it { should have_many :player_rounds }
  end
end
