class Review < ApplicationRecord
  belongs_to :essay
  belongs_to :reviewer, class_name: 'User'
  has_many :comments, dependent: :destroy

  validates :score, presence: true
  validates_inclusion_of :score, in: 0..100
end
