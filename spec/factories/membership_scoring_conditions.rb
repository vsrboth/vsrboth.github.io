# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :membership_scoring_condition do
    first_operand 1
    operator "MyString"
    second_oeprand 1
  end
end
