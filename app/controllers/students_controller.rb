class StudentsController < ApplicationController
  resource_controller

  index.wants.js do
    render :template => 'students/index.erb.js'
  end

end
