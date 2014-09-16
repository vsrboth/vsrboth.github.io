# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service_item_package do
    item_package "MyString"
    price "9.99"
  end
end
