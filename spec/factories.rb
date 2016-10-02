FactoryGirl.define do
  factory :blog_post do
    title "Blog Post Title"
    blog_entry "This is a blog entry. It has two sentences"
    author "Lukas"
    user_id = @user.id
  end
end
