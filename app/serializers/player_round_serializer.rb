class PlayerRoundSerializer < ActiveModel::Serializer
  attributes :player_id, :total_score, :score

  def score
    object.total_score - object.layout.total_par
  end
end
