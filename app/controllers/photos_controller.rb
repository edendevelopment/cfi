class PhotosController < ResourceController::Base
  belongs_to :student
  
  create.wants.html do
    redirect_to student_photos_path(@student)
  end
end