class PhotosController < ApplicationController
  resource_controller
  belongs_to :person
  
  create.wants.html do
    redirect_to person_photos_path(@person)
  end
end