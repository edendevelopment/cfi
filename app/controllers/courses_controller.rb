class CoursesController < ResourceController::Base
  create.wants.html { redirect_to courses_path }
end
