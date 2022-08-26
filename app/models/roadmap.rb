class Roadmap < ApplicationRecord
  has_many :checkpoints

  def self.get_or_Create()
    roadmap = Roadmap.first()
    if roadmap.nil? 
      roadmap = Roadmap.new(title: 'El camino para convertirte en dev en 3 meses', project_link: 'https://fintual.notion.site/Paraffin-7eeb003d91614a2cbed2a2e260efde61')
      roadmap.save!
    else
      return roadmap
    end
  end
end