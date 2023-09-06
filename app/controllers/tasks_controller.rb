class TasksController < ApplicationController
  # /tasks
  def index
    @tasks = policy_scope(Task)
    # authorize @tasks
  end

  # /tasks/:id
  def show
    @plans = Plan.all
    @task = Task.find(params[:id])
    # @task.user = current_user
    authorize @task
    # raise
  end

  # GET /plans/:plan_id/tasks/new
  def new
    @task = task.new
    # find plan
    # initialize new task
  end

  # POST /plans/:plan_id/tasks
  def create
    # Find the plan
    # initialize ne task with task_params
    # attach the plan to the task
    # Try to save the task
    # -> redirect or render new page again
  end

  def task_params
    params.require(:task).permit(:activity, :completion, :priority, :due_date)
  end
end
