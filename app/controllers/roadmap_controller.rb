class RoadmapController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @roadmap = Roadmap.get_or_Create()
    @checkpoints = Checkpoint.get_or_Create(@roadmap)
  end
end
