class AddAttachmentPhotoToBlogPosts < ActiveRecord::Migration
  def self.up
    change_table :blog_posts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :blog_posts, :photo
  end
end
