require 'rails_helper'

describe Course, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :holes }
    it { should validate_presence_of :rating }
  end

  context 'relationships' do
    it { should have_many :layouts }

    it 'accepts nested attributes' do
      course = Course.create!({
        name: 'Village Greens',
        description: nil,
        city: 'Greenwood Village',
        state: 'CO',
        location: '(-104.878147,39.637633)/-104.878147,39.637633,12/',
        rating: 4,
        holes: 9,
        availability: 'Year Round',
        tees: 'Concrete',
        targets: 'Mach V',
        property: 'Public Park',
        services: 'Dogs Allowed, Restrooms Available',
        established: '2013',
        layouts_attributes: [
          {
            name: 'Main',
            description: 'Test Description',
            total_par: 58,
            total_distance: 5437,
            holes_attributes: [
              {hole_number: 1, par: 3, distance: 198},
              {hole_number: 2, par: 3, distance: 198},
              {hole_number: 3, par: 3, distance: 198},
            ]
          },
          {
            name: 'Alt',
            description: 'Test Description',
            total_par: 58,
            total_distance: 5437,
            holes_attributes: [
              {hole_number: 1, par: 3, distance: 198},
              {hole_number: 2, par: 3, distance: 198},
              {hole_number: 3, par: 3, distance: 198},
            ]
          }
        ]
      })

      expect(course.layouts.count).to eq 2
      expect(Hole.count).to eq 6
    end
  end
end