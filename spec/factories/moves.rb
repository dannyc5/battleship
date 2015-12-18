FactoryGirl.define do
  factory :move do
    association :player, factory: :human
    row 1
    column 1
  end
end
