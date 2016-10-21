class BlogPost < ApplicationRecord
  scope :your_posts, ->(user) { where(user: user) }
  scope :other_posts, ->(user) { where.not(user: user) }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings, class_name: 'Tag'

  accepts_nested_attributes_for :tags, reject_if: :all_blank,
                                       allow_destroy: true

  validates :title, :blog_entry, presence: true

  def validate_associated_records_for_tags
    self.tags = tags.map do |tag|
      existing_tag = Tag.find_by(name: tag.name)
      if existing_tag
        existing_tag
      else
        tag
      end
    end
  end
end
