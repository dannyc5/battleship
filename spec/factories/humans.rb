FactoryGirl.define do
  factory :human do
    association :game
    type 'Human'
    name { Faker::Lorem.name }
  end
end
