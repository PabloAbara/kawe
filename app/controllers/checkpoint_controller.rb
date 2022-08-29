class CheckpointController < ApplicationController
  def show
    @checkpoint = Roadmap.first().checkpoints[0]
  end

  def resource
     ResourceRating.create!(:user_id => current_user.id, :resource_id => params[:resource][:resource_id].to_i, :rating => params[:resource][:rating].to_i)
     p "************************************************************Se ha creado un resource rating!! ************************************************************"
  end

end
