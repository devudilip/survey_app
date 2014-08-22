# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    user_name "Name"
    email "admin@survey.com"
    password "123456789"
    password_confirmation "123456789"
    is_admin true
    confirmed_at Time.now-1.day
  end
end
