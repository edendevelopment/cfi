class PhotosController < ApplicationController
  # belongs_to :person
  
  # create.wants.html do
  def create
    redirect_to person_photos_path(@person)
  end
end