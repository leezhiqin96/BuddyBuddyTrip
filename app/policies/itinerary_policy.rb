class ItineraryPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    user.present?
  end

  def edit?
    collaboration = Collaboration.find_by(user:)
    # record.collaborations.find_by(user:).user == user &&
    collaboration.editor?
  end

  def destroy?
    record.owner == user
  end
end
