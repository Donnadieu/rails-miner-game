class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include ApplicationHelper

  def index
    redirect_to user_path(current_user)
  end
end
