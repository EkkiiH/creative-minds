class AddDateToSubtasks < ActiveRecord::Migration[7.0]
  def change
    add_column :subtasks, :start_date, :date
    add_column :subtasks, :end_date, :date
  end
end
