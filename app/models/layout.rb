class Layout < ApplicationRecord
  validates_presence_of :name, :total_par
  belongs_to :course
  has_many :holes
  accepts_nested_attributes_for :holes

  scope :active, -> { where(active: true) }
end