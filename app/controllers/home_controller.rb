class HomeController < ApplicationController
  def index
    redirect_to roadmaps_path if user_signed_in?
  end
end
