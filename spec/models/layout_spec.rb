require 'rails_helper'

describe Layout, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :total_par }
  end

  context 'relationships' do
    it { should belong_to :course }
    it { should have_many :holes }
  end
end