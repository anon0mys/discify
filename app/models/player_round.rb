class PlayerRound < ApplicationRecord
  validates_presence_of :total_score
  belongs_to :player
  belongs_to :round
  has_one :layout, through: :round
  has_many :scores

  def score_round
    self.update!(total_score: scores.sum(:strokes))
  end

  def score
    total_score - layout.holes.sum(:par)
  end
end
