class PlansController < ApplicationController
  def index
    @plans = Plan.all
    @plans = policy_scope(Plan)
    # authorize @plans
  end

  def show
    @plan = Plan.find(params[:id])
    # @plan.user = current_user
    authorize @plan
    # raise
  end

  def plan_params
    params.require(:plan).permit(:name, :description, :start_date, :end_date)
  end
end
