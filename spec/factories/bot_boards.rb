FactoryGirl.define do
  factory :bot_board do
    association :game
    type 'BotBoard'
    name { Faker::Lorem.name }
  end
end
