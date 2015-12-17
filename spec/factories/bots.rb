FactoryGirl.define do
  factory :bot do
    type 'Bot'
    name { Faker::Lorem.name }
  end
end
