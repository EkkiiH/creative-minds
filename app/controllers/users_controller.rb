class UsersController < ApplicationController
  def show
    # @user = User.find(params[:id])
    @user = current_user
    authorize @user
    @plans = Plan.all
    @taks = Task.all
  end
end
