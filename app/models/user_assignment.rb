class UserAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :assignment

  has_one :essay, dependent: :destroy

  validates :user, presence: true
  validates :assignment, presence: true

  def submitted?
    essay
  end
end
