FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    sequence(:name) { |o| "Generic#{o} Name" }
    password "password"
    password_confirmation "password"
    sequence(:username) { |q| "Username#{q}" }
  end

  factory :blog_post do
    sequence(:title) { |r| "#{r} Title for Post" }
    sequence(:blog_entry) { |s| "This is number #{s} in our blog entries, to show how they work" }
    user
  end

  factory :comment do
    sequence(:comment_entry) { |t| "This is the #{t} comment entry"}
    blog_post
    user
  end

  factory :tag do
    sequence(:name) { |l| "Name#{l}"}
  end

  factory :tagging do
    blog_post
    tag
  end
end
