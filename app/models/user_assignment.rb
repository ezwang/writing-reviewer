# frozen_string_literal: true

class UserAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :assignment

  has_one :essay, dependent: :destroy

  validates :user, presence: true
  validates :assignment, presence: true

  # Has the user submitted an essay?
  def submitted?
    essay
  end

  # Has the user left at least one comment on each essay?
  def reviewed?
    review_count = Review.where(user: user, essay: assignment.essays).count
    total_count = assignment.user_assignments.count
    total_count - review_count - 1 <= 0
  end
end
