class PlayerRound < ApplicationRecord
  validates_presence_of :total_score
  belongs_to :player
  belongs_to :round
  has_one :layout, through: :round
  has_many :scores
end
