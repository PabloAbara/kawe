class ApplicationController < ActionController::Base
  protect_from_forgery

  def access_denied(exception)
    redirect_to admin_organizations_path, alert: exception.message
  end

  def after_sign_in_path_for(_resource_or_scope)
    roadmaps_path
  end

  rescue_from CanCan::AccessDenied do |_exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
end
