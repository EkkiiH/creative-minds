class PlansController < ApplicationController

  def index
    @plans = Plan.all
    @plans = policy_scope(Plan)
  end

  def show
    @plan = Plan.find(params[:id])
    authorize @plan
  end

  def new
    @plan = Plan.new
    authorize @plan
    @name_query = params[:name_query]
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user = current_user
    authorize @plan
    @name_query = params[:name_query]
    if @plan.save
      params[:new_task].in?([true, "true"]) ? redirect_to(new_plan_task_path(@plan)) : redirect_to(plans_path(@plans))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def plan_tasks
    @plan = Plan.find(params[:id])
    authorize @plan
    @tasks = @plan.tasks
  end

  def edit
    @plan = Plan.find(params[:id])
    authorize @plan
  end

  def update
    @plan = Plan.find(params[:id])
    authorize @plan
    if @plan.update(plan_params)
      redirect_to plan_path(@plan)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    authorize @plan
    @plan.destroy
    redirect_to plans_path
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :description, :start_date, :end_date)
  end
end
