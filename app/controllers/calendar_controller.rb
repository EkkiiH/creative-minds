class CalendarController < ApplicationController

  def start_time
    task.due_date
  end

  def index
    @tasks = policy_scope(Task)
  end
end
