class PlanPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    # true
    record.user == user
  end

  def show?
    # true
    record.user == user
  end
end
