class CommentPolicy < ApplicationPolicy

  def update?
    record.user == user
  end
  alias destroy? update?
  
end
