class BlogPost < ApplicationRecord
  include AASM

  has_attached_file :photo, :styles => {
    :medium => "300x300>", :thumb => "100x100>"
    }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  scope :your_posts, ->(user) { where(user: user) }
  scope :other_posts, ->(user) { where.not(user: user) }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings, class_name: 'Tag'

  accepts_nested_attributes_for :tags, reject_if: :all_blank,
                                       allow_destroy: true

  validates :title, :blog_entry, presence: true

  enum state: [:draft, :published]

  aasm :column => :state, :enum => true do
    state :draft, initial: true
    state :published

    event :drafting do
      transitions from: :published, to: :draft
    end

    event :publishing do
      transitions from: :draft, to: :published
    end
  end

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

# ## Schema Information
#
# Table name: `blog_posts`
#
# ### Columns
#
# Name                      | Type               | Attributes
# ------------------------- | ------------------ | ---------------------------
# **`author`**              | `string`           |
# **`blog_entry`**          | `text`             |
# **`created_at`**          | `datetime`         | `not null`
# **`id`**                  | `integer`          | `not null, primary key`
# **`photo_content_type`**  | `string`           |
# **`photo_file_name`**     | `string`           |
# **`photo_file_size`**     | `integer`          |
# **`photo_updated_at`**    | `datetime`         |
# **`state`**               | `integer`          | `default("draft")`
# **`title`**               | `string`           |
# **`updated_at`**          | `datetime`         | `not null`
# **`user_id`**             | `integer`          |
#
