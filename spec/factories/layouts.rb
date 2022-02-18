FactoryBot.define do
  factory :layout do
    name { "Main" }
    description { 'Test Description' }
    total_par { 58 }
    total_distance { 5437 }
    association :course

    factory :eighteen_hole_layout do
      after :create do |layout|
        create_list :hole, 18, layout: layout
      end
    end

    factory :nine_hole_layout do
      after :create do |layout|
        create_list :hole, 9, layout: layout
      end
    end
  end
end