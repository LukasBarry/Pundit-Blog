class ActiveAdmin::PagePolicy < ApplicationPolicy
  def dashboard?
    true
  end
end
