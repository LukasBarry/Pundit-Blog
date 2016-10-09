class ActiveAdmin::CommentPolicy < ApplicationPolicy
  def update?
    record.author == user
  end
  alias destroy? update?
  alias edit? update?
end
