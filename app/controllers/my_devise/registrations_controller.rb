class MyDevise::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    # binding.pry
  end

  def update
    super
  end
end
