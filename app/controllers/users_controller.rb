class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index
    redirect_to user_path(current_user)
  end

  def show
    respond_to do |format|
      format.html { render 'show'}
      format.json { render json: @user, status: 200}
    end
  end

  def highest_balance
    @users = User.highest_balance
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
