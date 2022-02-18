FactoryBot.define do
  factory :course do
    name { 'Village Greens' }
    description { nil }
    city { 'Greenwood Village' }
    state { 'CO' }
    location { '(-104.878147,39.637633)/-104.878147,39.637633,12/' }
    rating { 4 }
    holes { 9 }
    availability { 'Year Round' }
    tees { 'Concrete' }
    targets { 'Mach V' }
    property { 'Public Park' }
    services { 'Dogs Allowed, Restrooms Available' }
    established { '2013' }

    factory :full_course do
      after :create do |course|
        create :eighteen_hole_layout, course: course
        create :nine_hole_layout, course: course
      end
    end
  end
end

