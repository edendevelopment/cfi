class VillagesController < ApplicationController
  resource_controller
  
  create.wants.html do
    redirect_to villages_path
  end
end