FactoryGirl.define do
  factory :bot do
    association :game
    type 'Bot'
    name { Faker::Lorem.name }
  end
end
