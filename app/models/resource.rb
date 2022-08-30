# frozen_string_literal: true

class Resource < ApplicationRecord
  belongs_to :checkpoint
  has_many :resource_ratings
end
