class RoundSerializer < ActiveModel::Serializer
  attributes :id, :course_name, :layout_name, :total_par, :date, :scores

  has_many :holes, serializer: HoleSerializer do
    object.layout.holes
  end

  has_many :scores, serializer: PlayerRoundSerializer do
    object.player_rounds.order(total_score: :asc)
  end

  def course_name
    object.course.name
  end

  def layout_name
    object.layout.name
  end

  def total_par
    object.layout.holes.sum(:par)
  end

  def date
    object.created_at.strftime('%m/%d/%Y')
  end
end
