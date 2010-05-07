class CoursesController < ResourceController::Base
  load_and_authorize_resource
  create.wants.html { redirect_to courses_path }
end
