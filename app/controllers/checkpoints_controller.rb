class CheckpointsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_roadmap
  before_action :set_checkpoint

  def show
    @resources_ratings = ResourceRatingCalculator.get_resources_with_average(@checkpoint)
  end

  def rate_resource
    if resource_params.nil? || resource_params[:resource_id].nil? || resource_params[:rating].nil?
      redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint),
                  alert: "Error: Recurso no evaluado"
    else
      new_resource_rating = ResourceRating.create(
        user_id: current_user.id,
        resource_id: resource_params[:resource_id].to_i,
        rating: resource_params[:rating].to_i
      )
      alert_new_resource_rating = new_resource_rating.errors.any? ? new_resource_rating.errors.full_messages.join(";") : ""
      if alert_new_resource_rating.empty?
        redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint),
                    notice: "Se ha evaluado un recurso!"
      else
        redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint), alert: alert_new_resource_rating
      end
    end
  end

  def create_resource
    if new_resource_params.nil? || new_resource_params[:title].empty? || new_resource_params[:link].empty?
      redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint), alert: "Error: Recurso no creado"
    else
      new_resource = Resource.create(
        checkpoint_id: @checkpoint.id,
        title: new_resource_params[:title],
        link: new_resource_params[:link]
      )
      alert_new_resource = new_resource.errors.any? ? new_resource.errors.full_messages.join(";") : ""
      if alert_new_resource.empty?
        redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint),
                    notice: "Se ha creado un nuevo recurso!"
      else
        redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint), alert: alert_new_resource
      end
    end
  end

  def delete_resource
    if params[:resource_id].present? && @checkpoint.resources.find_by(id: params[:resource_id])
      resource = @checkpoint.resources.find_by(id: params[:resource_id])
      deleted_resource = resource.destroy!
      alert_deleted_resource = deleted_resource.errors.any? ? deleted_resource.errors.full_messages.join(";") : ""
      if alert_deleted_resource.empty?
        redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint),
                    notice: "El recurso ha sido eliminado."
      else
        redirect_to roadmap_checkpoint_path(@roadmap, @checkpoint), alert: alert_deleted_resource
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

  def resource_params
    params.require(:resource).permit(:resource_id, :rating)
  end

  def new_resource_params
    if params[:resource].present? && params[:title].present? && params[:link].present?
      params.require(:resource).permit(:title, :link)
    else
      nil
    end
  end
end
