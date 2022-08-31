class Roadmap < ApplicationRecord
  has_many :checkpoints, dependent: :destroy
end
