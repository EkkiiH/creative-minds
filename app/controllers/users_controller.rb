class UsersController < ApplicationController
  def show
    # @user = User.find(params[:id])
    @user = current_user
    authorize @user
    @plans = Plan.all
    @tasks = Task.all
  end
end
