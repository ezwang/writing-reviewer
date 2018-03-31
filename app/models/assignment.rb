class Assignment < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  validates :due_date, presence: true
  validates :review_date, presence: true, date: { after_or_equal: :due_date }
end
