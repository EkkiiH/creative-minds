class Task < ApplicationRecord
  belongs_to :plan
  has_one :user, through: :plan
  has_many :subtasks, dependent: :destroy
  validates :activity, length: { maximum: 60, too_long: 'A maximum of 60 characters is allowed' }
  validates :activity, uniqueness: true
  validates :activity, presence: true
  validates :priority, numericality: { in: 0..2 }

  # When a task is updated, then lets reoplace the progress bar
  after_update_commit :update_progress_bar

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
