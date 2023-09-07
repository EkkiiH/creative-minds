class Task < ApplicationRecord
  belongs_to :plan
  has_one :user, through: :plan
  validates :activity, length: { maximum: 60, too_long: 'A maximum of 60 characters is allowed' }
  validates :activity, uniqueness: true
  validates :activity, presence: true
  validates :priority, numericality: { in: 0..2 }
end
