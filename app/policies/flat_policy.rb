class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    record.user == user || user.admin
  end
end
