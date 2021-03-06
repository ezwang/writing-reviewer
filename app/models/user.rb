# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :given_assignments, class_name: 'Assignment', foreign_key: 'creator_id'
  has_many :user_assignments, dependent: :destroy
  has_many :assignments, through: :user_assignments, inverse_of: :students
  has_many :reviews, dependent: :destroy

  validates :status, presence: true, inclusion: { in: ['student', 'teacher'] }

  def username
    @username ||= email.split('@')[0]
  end

  def teacher?
    status == 'teacher'
  end

  def student?
    status == 'student'
  end

  def assignment?(assignment)
    UserAssignment.exists?(assignment: assignment, user: id)
  end

  def assignments_to_turn_in
    assignments.where('due_date > ?', 2.days.ago)
  end

  def assignments_to_review
    assignments.where('review_date > ?', Time.now).where('due_date < ?', Time.now)
  end
end
