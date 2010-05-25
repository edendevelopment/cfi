class PeopleController < ApplicationController
  resource_controller

  def add_comment
    person = Person.find(params[:id])
    person.add_comment(params[:comment], current_user) unless params[:comment].blank?
    redirect_to person_path(person)
  end
  
  def make_student
    object.make_student!
    redirect_to person_path(object)
  end
  
  def basic_information
    @person = object
  end
  
  def address
    @person = object
  end
  
  def siblings
    @person = object
  end
end

