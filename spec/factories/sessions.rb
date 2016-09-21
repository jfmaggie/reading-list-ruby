FactoryGirl.define do
  factory :session do
    token "MyString"
    ttl 1
    user nil
  end
end
