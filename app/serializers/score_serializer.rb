class ScoreSerializer < ActiveModel::Serializer
  attributes :player_id, :score, :strokes

  def player_id
    object.player_round.player.id
  end
end
