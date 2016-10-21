class BlogPost < ApplicationRecord
  include AASM

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
