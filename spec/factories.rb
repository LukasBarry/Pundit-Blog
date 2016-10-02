FactoryGirl.define do
  factory :blog_post do
    title "Blog Post Title"
    blog_entry "This is a blog entry. It has two sentences"
    author "Lukas"
  end

  factory :comment do
    comment_entry "This is my comment"
    author "Carolyn"
    blog_post
  end

  factory :user do
    email "user@user.com"
    name "User"
    password "password"
    password_confirmation "password"
    username "Username"
  end
end
