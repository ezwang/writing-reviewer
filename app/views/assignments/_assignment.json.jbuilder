# frozen_string_literal: true

json.extract! assignment, :id, :creator_id, :due_date, :review_date, :created_at, :updated_at
json.url assignment_url(assignment, format: :json)
