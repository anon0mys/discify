class Layout < ApplicationRecord
  validates_presence_of :name, :holes, :par, :total_distance
  belongs_to :course
  has_many :holes
end