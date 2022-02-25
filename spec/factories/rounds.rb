FactoryBot.define do
  factory :round do
    association :course
    association :layout

    factory :complete_round do
      after :create do |round|
        round.layout = create(:eighteen_hole_layout)
        round.save!
      end
    end
  end
end
