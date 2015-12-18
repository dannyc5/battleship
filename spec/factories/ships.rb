FactoryGirl.define do
  factory :ship do
    association :board
    row 1
    column 1

    trait :invalid_coordinate do
      row 0
      column 0
    end
  end
end
