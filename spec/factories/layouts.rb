FactoryBot.define do
  factory :layout do
    name { "Main" }
    description { 'Test Description' }
    total_par { 58 }
    total_distance { 5437 }
    association :course
  end
end