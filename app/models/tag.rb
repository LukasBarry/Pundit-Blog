class Tag < ApplicationRecord
  has_many :taggings
  has_many :blog_posts, through: :taggings
  validates :name, uniqueness: true
end
