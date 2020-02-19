class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    # verifier que l'utilisateur a deja fait un booking dans ce flat
    if user == nil
      false
    else
      user.bookings.include?(@flat) || user.admin
    end
  end
end
