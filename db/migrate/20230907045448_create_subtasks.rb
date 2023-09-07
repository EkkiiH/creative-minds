class CreateSubtasks < ActiveRecord::Migration[7.0]
  def change
    create_table :subtasks do |t|
      t.string :activity
      t.boolean :completion
      t.integer :priority
      t.date :due_date
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
