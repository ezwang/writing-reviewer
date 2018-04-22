# frozen_string_literal: true

json.extract! essay, :id, :assignment_id, :created_at, :updated_at
json.url essay_url(essay, format: :json)
