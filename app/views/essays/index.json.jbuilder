# frozen_string_literal: true

json.array! @essays, partial: 'essays/essay', as: :essay
