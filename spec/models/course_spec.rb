require 'rails_helper'

describe Course, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :holes }
    it { should validate_presence_of :rating }
  end

  context 'relationships' do
    it { should have_many :layouts }
  end
end