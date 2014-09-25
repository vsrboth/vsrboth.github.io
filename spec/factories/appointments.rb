# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    client nil
    employee nil
    title "MyString"
    description "MyString"
    start_time "MyString"
    end_time "MyString"
  end
end
