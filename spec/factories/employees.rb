# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    code "MyString"
    first_name "MyString"
    last_name "MyString"
    gender "MyString"
    birthdate "MyString"
    position nil
  end
end
