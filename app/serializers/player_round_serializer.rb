class PlayerRoundSerializer < ActiveModel::Serializer
  attributes :player_id, :total_score, :score
end
