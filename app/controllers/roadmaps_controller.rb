class RoadmapsController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_to_show, only: [:index]
  
  def index; end

  def show
    @roadmap = default_roadmap
  end

  private

  def redirect_to_show
    redirect_to roadmap_path(default_roadmap)
  end

  def default_roadmap
    Roadmap.first
  end
end
