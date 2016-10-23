class Tag < ApplicationRecord
  has_many :taggings
  has_many :blog_posts, through: :taggings
  validates :name, uniqueness: true
end

# ## Schema Information
#
# Table name: `tags`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`created_at`**  | `datetime`         | `not null`
# **`id`**          | `integer`          | `not null, primary key`
# **`name`**        | `string`           |
# **`updated_at`**  | `datetime`         | `not null`
#
