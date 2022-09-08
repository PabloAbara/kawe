class RoadmapsController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_to_show, only: [:index]
  before_action :set_roadmap, only: %i[show complete_checkpoint uncomplete_checkpoint
                                       create_checkpoint]

  def index; end

  def show; end

  def complete_checkpoint
    if params[:checkpoint_id].present? && @roadmap.checkpoints.find_by(id: params[:checkpoint_id])
      CompletedCheckpoint.create!(user_id: current_user.id, checkpoint_id: params[:checkpoint_id])
      redirect_to roadmap_path(@roadmap, message: "Checkpoint marcado como completo")
    else
      redirect_to roadmap_path(@roadmap, error: "No se envió checkpoint o este es inválido.")
    end
  end

  def uncomplete_checkpoint
    if params[:checkpoint_id].present? && @roadmap.checkpoints.find_by(id: params[:checkpoint_id])
      checkpoint = @roadmap.checkpoints.find(params[:checkpoint_id])
      if checkpoint.completed_checkpoints.find_by(user_id: current_user.id).present?
        completed_checkpoint = checkpoint.completed_checkpoints.find_by(user_id: current_user.id)
        completed_checkpoint.destroy!
        redirect_to roadmap_path(@roadmap, message: "Completed checkpoint eliminado")
      else
        redirect_to roadmap_path(@roadmap, error: "No se encontró completed checkpoint válido.")
      end
    else
      redirect_to roadmap_path(@roadmap, error: "No se envió checkpoint o este es inválido.")
    end
  end

  def create_checkpoint
    new_checkpoint = Checkpoint.create(
      roadmap_id: params.require(:roadmap_id),
      title: params.require(:checkpoint)[:title]
    )
    alert_checkpoint = new_checkpoint.errors.full_messages.join(";") if new_checkpoint.errors.any?
    redirect_to roadmap_path(@roadmap), alert: alert_checkpoint
  end

  private

  def redirect_to_show
    redirect_to roadmap_path(default_roadmap)
  end

  # Ciclo 1 considera sólo 1 Roadmap
  def default_roadmap
    Roadmap.first
  end

  def set_roadmap
    @roadmap = default_roadmap
  end
end
