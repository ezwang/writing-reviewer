class Comment < ApplicationRecord
  belongs_to :review

  validates :text, presence: true
end
