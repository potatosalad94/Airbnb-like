class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def accept_booking?
    is_owner_or_admin?
  end

  def decline_booking?
    is_owner_or_admin?
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
