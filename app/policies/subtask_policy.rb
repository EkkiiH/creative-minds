class SubtaskPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    true
  end

  def create?
    record.task.user == user
  end

  def edit?
    record.task.user == user
  end

  def update?
    record.task.user == user
  end

  def destroy?
    record.task.user == user
  end
end
