class Essay < ApplicationRecord
  belongs_to :assignment, class: 'UserAssignment'

  has_many :reviewers, dependent: :destroy
end
