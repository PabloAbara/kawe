class RoadmapController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @roadmap = Roadmap.first()
    @checkpoint = @roadmap.checkpoints.first()
  end
end
