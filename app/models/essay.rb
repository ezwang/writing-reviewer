class Essay < ApplicationRecord
  belongs_to :user_assignment

  has_many :reviews, dependent: :destroy
  has_many :comments, through: :reviews
  has_attached_file :file

  validates :user_assignment, presence: true, uniqueness: true
  validates :file, presence: true
  validates :file, attachment_content_type: { content_type: ['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'text/plain'] }

  def late?
    @late ||= updated_at > user_assignment.assignment.due_date
  end
end
