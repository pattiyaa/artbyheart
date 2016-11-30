class RegistrationsController < Devise::RegistrationsController
  def new
  	debugger
    super
  end

  def create
    # add custom create logic here
  end

  def update
    super
  end
end 