FactoryGirl.define do
  factory :human_board do
    association :game
    type 'HumanBoard'
    name { Faker::Lorem.name }
  end
end
