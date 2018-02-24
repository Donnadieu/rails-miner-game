class UsersController < ApplicationController
  def home
    @users = User.all
  end

  def show
    binding.pry
  end
end
