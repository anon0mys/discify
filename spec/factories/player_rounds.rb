FactoryBot.define do
  factory :player_round do
    total_score { 0 }

    association :player
    association :round
  end
end
