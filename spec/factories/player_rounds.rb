FactoryBot.define do
  factory :player_round do
    total_score { 0 }

    association :player
    association :round

    factory :complete_player_round do
      after :create do |player_round|
        player_round.round = create(:complete_round)
        player_round.save!
      end
    end
  end
end
