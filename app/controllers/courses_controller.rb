class CoursesController < InheritedResources::Base
  def create
    redirect_to courses_path
  end
end
