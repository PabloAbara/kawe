class Checkpoint < ApplicationRecord
  belongs_to :roadmap
  has_many :resources
  has_many :completed_checkpoints
  has_many :users, through: :completed_checkpoints  


  def self.get_or_Create(roadmap)
    checkpoint = roadmap.checkpoints.first()
    if checkpoint.nil?
      checkpoint = Checkpoint.new(title: 'Intro to Git', roadmap_id: roadmap.id)
      checkpoint.save!
    else
      return checkpoint
    end
  end
end
