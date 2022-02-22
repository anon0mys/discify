class Player < ApplicationRecord
  validates_presence_of :name
  has_many :player_rounds

  def average_score
    scores = player_rounds.all.map(&:score)
    return 0 if scores.empty?
    scores.sum / scores.count
  end
end
