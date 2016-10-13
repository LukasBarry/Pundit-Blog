class BlogPost < ApplicationRecord
  # scope :your_posts, -> { where('blog_post.user_id == ?', ) }
  # scope :other_posts, -> { where('blog_post.user_id != ?', ) }
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :blog_entry, presence: true
end
