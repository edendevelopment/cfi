class CoursesController < InheritedResources::Base
  def create
    create! { courses_path }
  end
end
