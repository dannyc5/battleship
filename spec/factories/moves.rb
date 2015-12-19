FactoryGirl.define do
  factory :move do
    association :player, factory: :human
    row 1
    column 1
    hit false
  end
end
