class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :average_score, :rounds_played

  def rounds_played
    object.player_rounds.count
  end
end
