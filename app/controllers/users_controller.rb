class UsersController < ApplicationController
  def show
    # @user = User.find(params[:id])
    @user = current_user
    @plans = Plan.all
    @tasks = Task.all
    authorize @user
    # raise
  end


end
