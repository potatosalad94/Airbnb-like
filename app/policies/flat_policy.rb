class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # pour avoir que les flats qui ont une lat et long mettre ceci a la place:
      # scope.where.not(latitude: nil, longitude: nil)
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    is_owner_or_admin?
  end

  def destroy?
    is_owner_or_admin?
  end

  private

  def is_owner_or_admin?
    if user == nil
      false
    else
      record.user == user || user.admin
    end
  end
end
