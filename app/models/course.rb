class Course < ApplicationRecord
  include Filterable

  validates_presence_of :name, :city, :state, :rating, :holes
  has_many :layouts

  scope :filter_by_name, -> (name) { where 'name ILIKE ?', "%#{name.downcase}%" }
  scope :filter_by_rating_min, -> (rating) { where 'rating >= ?', rating }
  scope :filter_by_holes_min, -> (holes) { where 'holes >= ?', holes }
  scope :filter_by_city, -> (city) { where 'city ILIKE ?', "%#{city.downcase}%" }
  scope :filter_by_state, -> (state) { where state: state }
end