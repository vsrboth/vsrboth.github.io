# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice_detail do
    invoice nil
    employee nil
    service_item nil
    new_price "9.99"
    discount_type "MyString"
    discount_value "9.99"
  end
end
