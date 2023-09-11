class Subtask < ApplicationRecord
  belongs_to :task
  validates :activity, length: { maximum: 60, too_long: 'A maximum of 60 characters is allowed' }
  validates :activity, uniqueness: true
  validates :activity, presence: true
  validates :priority, numericality: { in: 0..2 }

  PRIORITIES = [['low', '0'], ['medium', '1'], ['high', '2']]

end
