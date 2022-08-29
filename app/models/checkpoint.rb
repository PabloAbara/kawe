class Checkpoint < ApplicationRecord
  belongs_to :roadmap
  has_many :resources
  has_many :completed_checkpoints
  has_many :users, through: :completed_checkpoints  

end
