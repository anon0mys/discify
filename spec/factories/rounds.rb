FactoryBot.define do
  factory :round do
    association :course
    association :layout
  end
end
