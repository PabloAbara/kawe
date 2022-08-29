class RoadmapController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @roadmap = Roadmap.first()
    @checkpoints = @roadmap.checkpoints
  end
end
