class Subtask < ApplicationRecord
  belongs_to :task
  has_one :plan, through: :task
  validates :activity, length: { maximum: 60, too_long: 'A maximum of 60 characters is allowed' }
  validates :activity, uniqueness: true
  validates :activity, presence: true
  validates :priority, numericality: { in: 0..2 }
  validates :due_date, presence: true
  validate :date_range

  PRIORITIES = [['low', '0'], ['medium', '1'], ['high', '2']]

  after_save_commit :update_parent_task_completion

  def update_parent_task_completion
    all_subtasks = task.subtasks
    all_completed = all_subtasks.all?{ |sub| sub.completion }
    task.update(completion: all_completed)
  end

  def date_range
    unless (plan.start_date..plan.end_date).include?(due_date)
      errors.add(:due_date, 'must be within the start and end date of plan')
    end
  end
end
