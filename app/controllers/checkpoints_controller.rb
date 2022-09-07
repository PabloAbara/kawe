class CheckpointsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_roadmap
  before_action :set_checkpoint

  def show
    # @resources_rating = ResourceRatingCalculator.new
  end

  def rate_resource
    ResourceRating.create!(
      user_id: current_user.id,
      resource_id: resource_params[:resource_id].to_i,
      rating: resource_params[:rating].to_i
    )
    redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint)
  end

  def create_resource
    new_resource = Resource.create(
      checkpoint_id: @checkpoint.id,
      title: new_resource_params[:title],
      link: new_resource_params[:link]
    )
    alert_new_resource = new_resource.errors.any? ? new_resource.errors.full_messages.join(";") : ""
    redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint), alert: alert_new_resource
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

  def new_resource_params
    params.require(:resource).permit(:title, :link)
  end
end
