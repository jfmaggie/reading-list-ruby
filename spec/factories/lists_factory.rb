FactoryGirl.define do
  factory :list do
    name Faker::Company.catch_phrase
  end

  factory :invalid_list, class: List do
    name "bb"
  end
end
