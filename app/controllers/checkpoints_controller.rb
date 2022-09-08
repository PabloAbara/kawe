class CheckpointsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_roadmap
  before_action :set_checkpoint

  # load_and_authorize_resource



  def show
    @resources_ratings = ResourceRatingCalculator.get_resources_with_average(@checkpoint)
  end

  def rate_resource
    if rate_resource_params.nil?
      redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint),
                  alert: "Error: Recurso no evaluado"
    else
      new_resource_rating = ResourceRating.create(
        user_id: current_user.id,
        resource_id: rate_resource_params[:resource_id].to_i,
        rating: rate_resource_params[:rating].to_i
      )
      if new_resource_rating.errors.any?
        alert = new_resource_rating.errors.full_messages.join(";")
        redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint), alert: alert
      else
        redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint),
                    notice: "Se ha evaluado un recurso!"
      end
    end
  end

  def create_resource
    if new_resource_params.nil?
      redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint), alert: "Error: Recurso no creado"
    else
      new_resource = Resource.create(
        checkpoint_id: @checkpoint.id,
        title: new_resource_params[:title],
        link: new_resource_params[:link]
      )
      if new_resource.errors.any?
        alert = new_resource.errors.full_messages.join(";")
        redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint), alert: alert
      else
        redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint),
                    notice: "Se ha creado un nuevo recurso!"
      end
    end
  end

  def delete_resource
    if params[:resource_id].present? && @checkpoint.resources.find_by(id: params[:resource_id])
      resource = @checkpoint.resources.find_by(id: params[:resource_id])
      deleted_resource = resource.destroy!
      if deleted_resource.errors.any?
        alert = deleted_resource.errors.full_messages.join(";")
        redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint), alert: alert
      else
        redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint),
                    notice: "El recurso ha sido eliminado."
      end
    else
      redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint),
                  alert: "No se encontró recurso o este es inválido."
    end
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

  def rate_resource_params
    params.require(:resource).permit(:resource_id, :rating)
  end

  def new_resource_params
    params.require(:resource).permit(:title, :link) if params[:resource]
  end
end
