FactoryGirl.define do
  factory :game do

    trait :with_players do
      after(:create) do |game, evaluator|
        create(:human, game_id: game.id)
        create(:bot, game_id: game.id)
      end
    end
  end
end
