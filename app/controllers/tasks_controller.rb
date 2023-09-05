class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # @tasks = policy_scope(task)
    # authorize @tasks
  end

  def show
    @plans = Plan.all
    @task = Task.find(params[:id])
    # @task.user = current_user
    # authorize @task
    # raise
  end

  def task_params
    params.require(:task).permit(:activity, :completion, :priority, :due_date)
  end
end
