FactoryGirl.define do
  factory :move do
    association :cell
    hit false
  end
end
