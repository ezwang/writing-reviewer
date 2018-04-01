class Comment < ApplicationRecord
  belongs_to :review

  validate :text, presence: true
end
