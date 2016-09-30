class BlogPostPolicy < ApplicationPolicy

  def update?
    record.user == user
  end
  alias destroy? update?

end
