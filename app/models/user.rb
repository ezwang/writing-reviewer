class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :given_assignments, class_name: 'Assignment', foreign_key: 'creator_id'
  has_many :user_assignments, dependent: :destroy
  has_many :assignments, through: :user_assignment
  has_many :reviewed_essays, class_name: 'Review', dependent: :destroy

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
end
