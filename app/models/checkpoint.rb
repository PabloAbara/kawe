class Checkpoint < ApplicationRecord
  belongs_to :roadmap
  has_many :resources

end
