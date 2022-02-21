class RoundManager
  attr_accessor :round

  def initialize(round: nil)
    @round = round
  end

  def start_round(course_id:, layout_id:, player_ids:)
    @round = Round.create!(course_id: course_id, layout_id: layout_id)
    create_player_rounds(player_ids)
    self
  end

  def find_round(round_id)
    @round = Round.find(round_id)
    self
  end

  def end_round(player_scores: [])
    if player_scores.empty?
      calculate_round_scores
    else
      set_round_scores(player_scores)
    end
    self
  end

  def score_hole(hole_number:, player_scores: [])
    player_scores.map do |player_score|
      player_id, strokes = player_score.values_at('player_id', 'strokes').map(&:to_i)
      player_round = @round.player_rounds.find_by_player_id(player_id)
      hole = @round.layout.holes.find_by_hole_number(hole_number.to_i)
      score = strokes - hole.par
      Score.create!(player_round: player_round, hole: hole, strokes: strokes, score: score)
    end
  end

  private
  
  def create_player_rounds(player_ids)
    player_ids.each do |player_id|
      @round.player_rounds.create!(player_id: player_id, total_score: 0)
    end
  end

  def set_round_scores(player_scores)
    player_scores.each do |score|
      @round.player_rounds
            .find(score['player_id'])
            .update(total_score: score['total_score'])
    end
  end
end