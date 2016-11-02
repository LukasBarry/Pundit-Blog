class BlogPostPolicy < ApplicationPolicy
  def create?
    user.poster?
  end
end
