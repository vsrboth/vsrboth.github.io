# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service_item do
    category nil
    item "MyString"
    price "9.99"
  end
end
