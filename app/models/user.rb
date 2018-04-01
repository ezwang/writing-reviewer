class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :given_assignments, class_name: 'Assignment'
  has_many :user_assignments, dependent: :destroy
  has_many :assignments, through: :user_assignment

  validates :status, presence: true, inclusion: { in: ['student', 'teacher'] }

  def username
    @username ||= email.split('@')[0]
  end
end
