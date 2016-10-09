class UserPolicy < ApplicationPolicy
  def update?
    record == user
  end
  alias destroy? update?
  alias edit? update?
end
