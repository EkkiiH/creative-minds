class Task < ApplicationRecord
  belongs_to :plan
  has_one :user, through: :plan
  validates :activity, uniqueness: true
  validates :activity, presence: true
  validates :priority, numericality: { in: 0..2 }
end
