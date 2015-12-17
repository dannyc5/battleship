FactoryGirl.define do
  factory :human do
    type 'Human'
    name { Faker::Lorem.name }
  end
end
