class Plan < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :description, length: { maximum: 140, too_long: 'maxiumum 140 characters are allowed' }
end
