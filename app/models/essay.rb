class Essay < ApplicationRecord
  belongs_to :assignment, class_name: 'UserAssignment', foreign_key: 'assignment_id'

  has_many :reviewers, dependent: :destroy

  validates :assignment, presence: true
  validates :file, presence: true
  validates :file, attachment_content_type: { content_type: ['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'text/plain'] }
end
