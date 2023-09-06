class Task < ApplicationRecord
  belongs_to :plan
  has_one :user, through: :plan
  
end
