class Round < ApplicationRecord
  belongs_to :course
  belongs_to :layout
  has_many :player_rounds
  has_many :scores, through: :player_rounds
end
