class Assignment < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :user_assignments, dependent: :destroy
  has_many :students, through: :user_assignments, source: :user, inverse_of: :assignments
  has_many :essays, through: :user_assignments, source: :essay

  validates :title, presence: true

  validates :due_date, presence: true
  validates :review_date, presence: true, date: { after_or_equal: :due_date }

  def past_due?
    @past_due ||= due_date < Time.now
  end

  def past_review?
    @past_review ||= review_date < Time.now
  end
end
