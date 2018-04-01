class Assignment < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :user_assignments, dependent: :destroy
  has_many :users, through: :user_assignment

  validates :due_date, presence: true
  validates :review_date, presence: true, date: { after_or_equal: :due_date }
end
