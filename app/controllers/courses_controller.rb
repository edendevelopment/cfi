class CoursesController < ApplicationController
  resource_controller
  create.wants.html { redirect_to courses_path }
end
