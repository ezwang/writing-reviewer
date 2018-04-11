class Essay < ApplicationRecord
  belongs_to :user_assignment

  has_many :reviewers, dependent: :destroy
  has_attached_file :file

  validates :user_assignment, presence: true
  validates :file, presence: true
  validates :file, attachment_content_type: { content_type: ['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'text/plain'] }
end
