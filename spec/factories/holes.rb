FactoryBot.define do
  factory :hole do
    sequence(:hole_number) { |n| n }
    par { 3 }
    distance { 140 }
    association :layout
  end
end
