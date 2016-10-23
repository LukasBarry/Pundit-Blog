class Tagging < ApplicationRecord
  belongs_to :blog_post
  belongs_to :tag
end

# ## Schema Information
#
# Table name: `taggings`
#
# ### Columns
#
# Name                | Type               | Attributes
# ------------------- | ------------------ | ---------------------------
# **`blog_post_id`**  | `integer`          |
# **`created_at`**    | `datetime`         | `not null`
# **`id`**            | `integer`          | `not null, primary key`
# **`tag_id`**        | `integer`          |
# **`updated_at`**    | `datetime`         | `not null`
#
# ### Foreign Keys
#
# * `fk_rails_9fcd2e236b`:
#     * **`tag_id => tags.id`**
# * `fk_rails_b9157a4352`:
#     * **`blog_post_id => blog_posts.id`**
#
