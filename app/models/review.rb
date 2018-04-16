class Review < ApplicationRecord
  belongs_to :essay
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates_inclusion_of :score, in: 0..100, allow_nil: true
end
