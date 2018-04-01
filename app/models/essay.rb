class Essay < ApplicationRecord
  belongs_to :assignment, class: 'UserAssignment'

  has_many :reviewers, dependent: :destroy

  validates :assignment, presence: true
  validates :file, presence: true
  validates_attachment :file, content_type: { content_type: ['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'text/plain'] }
end
