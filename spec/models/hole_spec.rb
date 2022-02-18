require 'rails_helper'

describe Hole, type: :model do
  context 'validations' do
    it { should validate_presence_of :hole_number }
    it { should validate_presence_of :par }
    it { should validate_presence_of :distance }
  end

  context 'relationships' do
    it { should belong_to :layout }
  end
end