class CheckpointController < ApplicationController
  before_action :set_checkpoint, only: [:show, :rate_resource]

  def show
  end

  def rate_resource
     ResourceRating.create!(
      user_id: current_user.id, 
      resource_id: resource_params[:resource_id].to_i, 
      rating: resource_params[:rating].to_i
    )
     
     redirect_to checkpoint_show_url(@checkpoint)
  end

  def resource_params
    params.require(:resource).permit(:resource_id, :rating)
  end

  def set_checkpoint
    @checkpoint = Roadmap.first.checkpoints.first
  end

end
