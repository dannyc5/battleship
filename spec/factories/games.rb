FactoryGirl.define do
  factory :game do

    trait :with_player_boards do
      after(:create) do |game, evaluator|
        create(:human_board, game_id: game.id)
        create(:bot_board, game_id: game.id)
      end
    end
  end
end
