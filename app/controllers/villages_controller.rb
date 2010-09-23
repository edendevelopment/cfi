class VillagesController < ApplicationController  
  # index.before do
  def index
    @village = Village.new
  end
  
  # create do
  def create
    wants.html { back_to_view(@village.name, :created) }
    
    failure.wants.html { render :template => "villages/index" }
  end
  
  # update do
  def update
    wants.html { back_to_view(@village_name, :saved) }
  end

  private
  def back_to_view(name, action)
    flash[:notice] = "Village #{name} #{action}"
    redirect_to villages_path
  end
end
