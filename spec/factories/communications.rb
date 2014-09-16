# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :communication do
    client nil
    type ""
    value "MyString"
  end
end
