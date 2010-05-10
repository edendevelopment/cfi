class VillagesController < ApplicationController
  resource_controller
  
  index.before do
    @village = Village.new
  end
  
  create do
    wants.html do
      flash[:notice] = "Village #{@village.name} created"
      redirect_to villages_path
    end
    
    failure.wants.html { render :template => "villages/index" }
  end
  
  update do
    wants.html do
      flash[:notice] = "Village #{@village.name} saved"
      redirect_to villages_path
    end
  end
end