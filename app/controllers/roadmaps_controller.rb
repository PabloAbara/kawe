class RoadmapsController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_to_show, only: [:index]
  before_action :set_roadmap, only: %i[show complete_checkpoint uncomplete_checkpoint]

  def index; end

  def show; end

  def complete_checkpoint
    if params[:checkpoint_id].present? && @roadmap.checkpoints.find(params[:checkpoint_id]).present?
      CompletedCheckpoint.create!(user_id: current_user.id, checkpoint_id: params[:checkpoint_id])
      redirect_to roadmap_path(@roadmap)
    else
      redirect_to roadmap_path(@roadmap, error: "No encuentra checkpoint")
    end
  end

  def uncomplete_checkpoint
    checkpoint = @roadmap.checkpoints.find(params[:checkpoint_id])
    checkpoint.completed_checkpoints.find_by(user_id: current_user.id).destroy!
    redirect_to roadmap_path(@roadmap)
  end

  private

  def redirect_to_show
    redirect_to roadmap_path(default_roadmap)
  end

  def default_roadmap
    Roadmap.first
  end

  def set_roadmap
    @roadmap = default_roadmap
  end
end
