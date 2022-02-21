class RoundHoleSerializer < ActiveModel::Serializer
  attributes :hole_number

  has_many :scores, serializer: ScoreSerializer do
    object.scores.order(score: :asc)
  end

  def hole_number
    instance_options[:hole_number]
  end
end
