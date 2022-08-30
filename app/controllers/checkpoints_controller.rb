class CheckpointsController < ApplicationController
  before_action :set_roadmap
  before_action :set_checkpoint

  def show
    #@resources_rating = ResourceRatingCalculator.new
  end

  def rate_resource
    ResourceRating.create!(
      user_id: current_user.id, 
      resource_id: resource_params[:resource_id].to_i, 
      rating: resource_params[:rating].to_i
    )

    redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint)
  end

  private
  
  def set_roadmap
    @roadmap = Roadmap.find(roadmap_param)
  end

  def set_checkpoint
    @checkpoint = @roadmap.checkpoints.find(params[:id])
  end

  def roadmap_param
    params.require(:roadmap_id)
  end

  def resource_params
    params.require(:resource).permit(:resource_id, :rating)
  end
end
