class CollaborationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    record.itinerary.owner == user
  end

  def destroy?
    true
  end
end
