class CheckpointController < ApplicationController
  def show
    @checkpoint = Roadmap.first().checkpoints[0]
  end
end
