# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee_attendant do
    employee nil
    checkin_time "2014-09-08 00:01:31"
    checkin_status "MyString"
    checkout_time "2014-09-08 00:01:31"
    checkout_status "MyString"
  end
end
