FactoryBot.define do
  factory :hole do
    sequence(:hole_number) { |n| n }
    par { rand(2..5) }
    distance { rand(150..550) }
    association :layout
  end
end
