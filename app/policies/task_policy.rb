class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.joins(:plan).where(plan: { user: user })
    end
  end

  # def index?
  #   # true
  #   record.user == user
  # end
  def new?
    true
  end

  def new_without_plan?
    new?
  end

  def create?
    record.user == user
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def create_without_plan?
    record.user == user
  end

end
