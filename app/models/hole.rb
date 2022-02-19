class Hole < ApplicationRecord
  validates_presence_of :hole_number, :par, :distance
  belongs_to :layout
  has_many :scores
end