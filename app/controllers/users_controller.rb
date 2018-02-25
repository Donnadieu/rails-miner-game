class UsersController < ApplicationController

  def index
    binding.pry
    redirect_to user_path(current_user)
  end

  def show
  end
end
