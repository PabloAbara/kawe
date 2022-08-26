class RoadmapController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @roadmap = Roadmap.first()
    if @roadmap.nil? 
      @roadmap = Roadmap.new(title: 'El camino para convertirte en dev en 3 meses', project_link: 'https://fintual.notion.site/Paraffin-7eeb003d91614a2cbed2a2e260efde61')
      @roadmap.save!
    end
    @checkpoints = @roadmap.checkpoints()
    if @checkpoints.empty?
      p "************************************No hay checkpoints************************************"
    end
  end
end
