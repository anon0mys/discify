FactoryBot.define do
  factory :player_round do
    total_score { 0 }

    association :player
    association :round

    factory :complete_player_round do
      after :create do |player_round|
        player_round.round = create(:complete_round)
        player_round.scores = player_round.layout.holes.map do |hole|
          create(:score, hole: hole, player_round: player_round)
        end
        player_round.save!
      end
    end
  end
end
