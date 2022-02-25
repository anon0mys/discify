class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :name, :description, :city,
             :state, :location, :rating, :holes, :availability,
             :tees, :targets, :property, :services, :established

  has_many :layouts do
    @object.layouts.active
  end
end
