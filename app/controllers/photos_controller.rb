class PhotosController < InheritedResources::Base
  belongs_to :person
  
  def create
    redirect_to person_photos_path(@person)
  end
end