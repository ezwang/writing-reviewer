class UserAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :assignment

  has_one :essay, foreign_key: 'assignment_id', dependent: :destroy

  validates :user, presence: true
  validates :assignment, presence: true
end
