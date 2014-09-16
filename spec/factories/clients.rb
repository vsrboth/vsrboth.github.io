# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    title "MyString"
    first_name "MyString"
    last_name "MyString"
    gender "MyString"
    birth_date "MyString"
    occupation "MyString"
    address "MyString"
    remark "MyText"
  end
end
