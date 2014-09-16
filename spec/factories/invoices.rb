# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice do
    client nil
    deposit "9.99"
    payment_method "MyString"
    discount "9.99"
  end
end
