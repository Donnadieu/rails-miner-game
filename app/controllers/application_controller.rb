class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    redirect_to '/users'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:username, :email, :password)
    end
  end

  def enough_balance?(price)
    current_user.balance >= price
  end

  def valid_hashrate?
    case params[:mining_rig][:miners_attributes]['0'][:hash_rate].to_i
    when 14, 7, 3
      true
    else
      false
    end
  end
end
