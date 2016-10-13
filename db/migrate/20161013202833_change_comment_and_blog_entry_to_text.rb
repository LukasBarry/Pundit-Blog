class ChangeCommentAndBlogEntryToText < ActiveRecord::Migration[5.0]
  def change
    change_column :comments, :comment_entry, :text
    change_column :blog_posts, :blog_entry, :text
  end
end
