class AddHtmlEntryToBlogPost < ActiveRecord::Migration[5.0]
  def change
    add_column :blog_posts, :blog_entry_html, :text
  end
end
