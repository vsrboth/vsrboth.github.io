# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    client nil
    employee nil
    appointment_date "MyString"
    appointment_time "MyString"
  end
end
