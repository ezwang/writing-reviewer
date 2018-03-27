class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :given_assignments, class_name: 'Assignment'

  validates :status, presence: true, inclusion: { in: ['student', 'teacher'] }

  def username
    @username ||= email.split('@')[0]
  end
end
