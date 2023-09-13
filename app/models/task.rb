class Task < ApplicationRecord
  belongs_to :plan
  has_one :user, through: :plan
  has_many :subtasks, dependent: :destroy
  validates :activity, length: { maximum: 60, too_long: 'A maximum of 60 characters is allowed' }
  validates :activity, uniqueness: true
  validates :activity, presence: true
  validates :priority, numericality: { in: 0..2 }
  validates :due_date, presence: true
  validate :date_range

  def date_range
    unless (plan.start_date..plan.end_date).include?(due_date)
      errors.add(:due_date, 'must be within the start and end date of plan')
    end
  end

  # When a task is updated, then lets reoplace the progress bar
  after_update_commit :update_progress_bar
  after_save_commit :complete_all_subtasks

  PRIORITIES = [['low', '0'], ['medium', '1'], ['high', '2']]

  def complete_all_subtasks
    if completion
      subtasks.update_all(completion: true)
    end
  end

  def start_time
    self.due_date
  end

  def update_progress_bar
    broadcast_replace_to plan,
      target: "plan_#{plan.id}_progress",
      partial: 'plans/progress',
      locals: { plan: plan }
  end
end
