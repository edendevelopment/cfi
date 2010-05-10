class VillagesController < ApplicationController
  resource_controller
  
  create do
    wants.html do
      flash[:notice] = "Village #{@village.name} created"
      redirect_to villages_path
    end
    
    failure.wants.html { render :template => "villages/index" }
  end
end