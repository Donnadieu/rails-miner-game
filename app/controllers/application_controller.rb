class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
    binding.pry
    redirect_to '/home'
  end
end
