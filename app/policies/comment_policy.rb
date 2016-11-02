class CommentPolicy < ApplicationPolicy
  def destroy?
    super || record.blog_post.user == user
  end
end
