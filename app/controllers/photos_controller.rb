class PhotosController < InheritedResources::Base
  belongs_to :person
  
  def create
    create! { person_photos_path(@person) }
  end
end