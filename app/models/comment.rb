class Comment < ApplicationRecord
  belongs_to :blog_post
  belongs_to :user
  validates :comment_entry, presence: true
end
