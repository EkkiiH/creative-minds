class CalendarController < ApplicationController

  def start_time
    task.due_date
  end

  def index
    @tasks = policy_scope(Task)
    @tasks = Task.where(
      due_date: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
    )
  end
  @subtasks = Subtask.where(
    due_date: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
  )
end
