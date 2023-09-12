class Subtask < ApplicationRecord
  belongs_to :task
  validates :activity, length: { maximum: 60, too_long: 'A maximum of 60 characters is allowed' }
  validates :activity, uniqueness: true
  validates :activity, presence: true
  validates :priority, numericality: { in: 0..2 }

  PRIORITIES = [['low', '0'], ['medium', '1'], ['high', '2']]

  after_save_commit :update_parent_task_completion

  def update_parent_task_completion
    all_subtasks = task.subtasks
    all_completed = all_subtasks.all?{ |sub| sub.completion }
    task.update(completion: all_completed)
  end
end
