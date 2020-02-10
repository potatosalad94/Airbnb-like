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
    record.flat.user == user
  end

  def decline_booking?
    record.flat.user == user
  end
end
