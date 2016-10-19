class Comment < ApplicationRecord
  belongs_to :blog_post
  belongs_to :user
  validates :blog_post, :user, :comment_entry, presence: true
end
