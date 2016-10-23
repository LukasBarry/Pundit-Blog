class Comment < ApplicationRecord
  belongs_to :blog_post
  belongs_to :user
  validates :blog_post, :user, :comment_entry, presence: true
end

# ## Schema Information
#
# Table name: `comments`
#
# ### Columns
#
# Name                 | Type               | Attributes
# -------------------- | ------------------ | ---------------------------
# **`author`**         | `string`           |
# **`blog_post_id`**   | `integer`          |
# **`comment_entry`**  | `text`             |
# **`created_at`**     | `datetime`         | `not null`
# **`id`**             | `integer`          | `not null, primary key`
# **`updated_at`**     | `datetime`         | `not null`
# **`user_id`**        | `integer`          |
#
