class TasksController < ApplicationController
  # /tasks
  def index
    @tasks = policy_scope(Task)
    # authorize @tasks
  end

  # /tasks/:id
  # def show
  #   @plans = Plan.all
  #   @task = Task.find(params[:id])
  #   # @task.user = current_user
  #   authorize @task
  #   # raise
  # end

  # GET /plans/:plan_id/tasks/new
  def new
    @task = Task.new
    @plan = Plan.find(params[:plan_id])
    authorize @task
    # find plan
    # initialize new task
  end

  def new_without_plan
    @task = Task.new
    # @plan = Plan.find(params[:plan_id])
    authorize @task
    # find plan
    # initialize new task
  end

  def create_without_plan
    @task = Task.new(task_without_plan_params)
    @task.user = current_user
    authorize @task
    if @task.save
      redirect_to plan_path(@task.plan)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # POST /plans/:plan_id/tasks
  def create
    @task = Task.new(task_params)
    @plan = Plan.find(params[:plan_id])
    @task.plan = @plan
    @task.user = current_user
    authorize @task
    if @task.save
      redirect_to plan_path(@task.plan)
    else
      render :new, status: :unprocessable_entity
    end
    # Find the plan
    # initialize ne task with task_params
    # attach the plan to the task
    # Try to save the task
    # -> redirect or render new page again
  end

  def edit
    @task = Task.find(params[:id])
    authorize @task
  end

  def update
    @task = Task.find(params[:id])
    authorize @task
    if @task.update(task_params)
      redirect_to plan_path(@task.plan)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    authorize @task
    @task.destroy
    redirect_to task_path
  end

  # PATCH /tasks/:id/toggle_complete
  def toggle_complete
    @task = Task.find(params[:id])
    authorize @task, :update?
    @task.update(completion: !@task.completion)

    respond_to do |format|
      format.html { redirect_to plans_path }
      format.text { render partial: "task", task: @task, formats: [:html] }
    end

  end

  def task_params
    params.require(:task).permit(:activity, :completion, :priority, :due_date)
  end

  def task_without_plan_params
    params.require(:task).permit(:activity, :completion, :priority, :due_date, :plan_id)
  end
end
