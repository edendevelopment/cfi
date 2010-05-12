class VillagesController < ApplicationController
  resource_controller
  
  index.before do
    @village = Village.new
  end
  
  create do
    wants.html { back_to_view(@village.name, :created) }
    
    failure.wants.html { render :template => "villages/index" }
  end
  
  update do
    wants.html { back_to_view(@village_name, :saved) }
  end

  private
  def back_to_view(name, action)
    flash[:notice] = "Village #{name} #{action}"
    redirect_to villages_path
  end
end
