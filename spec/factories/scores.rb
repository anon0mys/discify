FactoryBot.define do
  factory :score do
    strokes { rand(1..4) }
    score { rand(-3..3) }

    association :player_round
    association :hole
  end
end
