class Course < ApplicationRecord
  include Filterable

  validates_presence_of :name, :city, :state, :rating, :holes
  has_many :layouts
  accepts_nested_attributes_for :layouts

  default_scope { order(:id) }
  scope :filter_by_name, -> (name) { where 'courses.name ILIKE ?', "%#{name.downcase}%" }
  scope :filter_by_rating_min, -> (rating) { where 'courses.rating >= ?', rating }
  scope :filter_by_holes_min, -> (holes) { where 'courses.holes >= ?', holes }
  scope :filter_by_city, -> (city) { where 'courses.city ILIKE ?', "%#{city.downcase}%" }
  scope :filter_by_state, -> (state) { where state: state }
  scope :active, -> { joins(:layouts).where(layouts: {active: true}).distinct }
end