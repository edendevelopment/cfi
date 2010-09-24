class VillagesController < InheritedResources::Base
  respond_to :html
    
  def index
    @village = Village.new
    index!
  end
  
  create! do |success, failure|
    success.html do 
      flash[:notice] = "Village #{@village.name} :created"
      redirect_to villages_path
    end
    
    failure.html do
      render "villages/index"
    end
  end
  
  update!(:notice => "Village #{@village_name} saved") { villages_path }
end
