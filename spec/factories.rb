FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    name "User"
    password "password"
    password_confirmation "password"
    username "Username"
  end

  factory :blog_post do
    title "Title"
    blog_entry "This is the blog entry"
    user
  end

  factory :comment do
    comment_entry "This is the comment entry"
    blog_post
    user
  end
end
