class Roadmap < ApplicationRecord
  has_many :checkpoints

  def self.default_roadmap
    Roadmap.find_by('Roadmap 1')
  end
end
