class Review < ApplicationRecord
  belongs_to :essay
  belongs_to :reviewer, class: 'User'

  validates :score, presence: true
  validates_inclusion_of :score, in: 0..100
end
