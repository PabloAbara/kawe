class Checkpoint < ApplicationRecord
  belongs_to :roadmap

  has_many :resources, dependent: :destroy
  has_many :completed_checkpoints, dependent: :destroy
  has_many :users, through: :completed_checkpoints

  validates :title, presence: true
end
