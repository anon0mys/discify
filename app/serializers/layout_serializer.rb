class LayoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :total_par, :total_distance, :holes

  has_many :holes
end
