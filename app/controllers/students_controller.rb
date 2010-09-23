class StudentsController < ApplicationController
  # index.wants.js do
  def index
    render :template => 'students/index.erb.js'
  end

end
