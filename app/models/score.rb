class Score < ApplicationRecord
  validates_presence_of :score, :strokes
  belongs_to :player_round
  belongs_to :hole
end
