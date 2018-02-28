class UsersController < ApplicationController

  def index
    redirect_to user_path(current_user)
  end

  def show
  end

  def highest_balance
    @users = User.highest_balance
  end
end
