# frozen_string_literal: true

class Roadmap < ApplicationRecord
  has_many :checkpoints
end
