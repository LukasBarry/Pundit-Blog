class AddAuthorToBlogPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :blog_posts, :author, :string
  end
end
