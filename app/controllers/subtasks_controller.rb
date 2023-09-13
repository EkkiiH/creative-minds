class SubtasksController < ApplicationController
  def new
    @subtask = Subtask.new
    @task = Task.find(params[:task_id])
    authorize @subtask
  end

  def create
    @subtask = Subtask.new(subtask_params)
    @task = Task.find(params[:task_id])
    @subtask.task = @task
    authorize @subtask
    if @subtask.save
      redirect_to plan_path(@subtask.task.plan)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @subtask = Subtask.find(params[:id])
    authorize @subtask
  end

  def update
    @subtask = Subtask.find(params[:id])
    authorize @subtask
    if @subtask.update(subtask_params)
      redirect_to plan_path(@subtask.task.plan)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subtask = Subtask.find(params[:id])
    authorize @subtask
    @subtask.destroy
    redirect_to task_path
  end

  def toggle_complete
    @subtask = Subtask.find(params[:id])
    authorize @subtask, :update?
    @subtask.update(completion: !@subtask.completion)
    redirect_to tasks_path
  end

  def subtask_params
    params.require(:subtask).permit(:activity, :completion, :priority, :due_date)
  end
end
