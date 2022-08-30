# frozen_string_literal: true

class ResourceRating < ApplicationRecord
  belongs_to :user
  belongs_to :resource
end
