class Plan < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :subtasks, through: :tasks, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :description, length: { maximum: 240, too_long: 'maxiumum 240 characters are allowed' }
end
