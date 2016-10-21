class AddAasmStateToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :state, :integer, default: 0
  end
end
