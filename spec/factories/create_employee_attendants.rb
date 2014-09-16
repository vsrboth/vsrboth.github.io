# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :create_employee_attendant, :class => 'CreateEmployeeAttendants' do
    employee nil
    checkin_time "2014-09-07 23:32:05"
    checkin_status "MyString"
    checkout_time "2014-09-07 23:32:05"
    checkout_status "MyString"
  end
end
