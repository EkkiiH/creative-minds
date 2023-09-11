class UsersController < ApplicationController
  def show
    # @user = User.find(params[:id])
    @user = current_user
    @plans = Plan.where(user: current_user)
    @tasks = Task.where(plan: @plans)
    # @subtaks = Subtask.where(task: @tasks)
    authorize @user
    # raise
  end
end
