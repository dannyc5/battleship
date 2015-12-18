FactoryGirl.define do
  factory :board do
    association :player, factory: :human
  end
end
