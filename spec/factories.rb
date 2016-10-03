FactoryGirl.define do
  factory :user do
    email "user@user.com"
    name "User"
    password "password"
    password_confirmation "password"
    username "Username"
  end
end
