class LayoutSerializer < ActiveModel::Serializer
  attributes :name, :description, :total_par, :total_distance, :holes

  has_many :holes
end
