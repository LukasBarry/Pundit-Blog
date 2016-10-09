class ActiveAdmin::CommentPolicy < ApplicationPolicy
  def update?
    record.author == user
  end
end
