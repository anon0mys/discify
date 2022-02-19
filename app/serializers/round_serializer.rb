class RoundSerializer < ActiveModel::Serializer
  attributes :id, :course_name, :layout_name, :date
  has_many :holes, serializer: HoleSerializer do
    object.layout.holes
  end

  def course_name
    object.course.name
  end

  def layout_name
    object.layout.name
  end

  def date
    object.created_at.strftime('%m/%d/%Y')
  end
end
