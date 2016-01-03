FactoryGirl.define do
  factory :player_board do
    association :game
    name { Faker::Lorem.name }
  end
end
