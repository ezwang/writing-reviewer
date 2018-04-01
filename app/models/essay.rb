class Essay < ApplicationRecord
  belongs_to :assignment, class: 'UserAssignment'
end
