class PeopleController < ApplicationController
  resource_controller
  
  create.failure.wants.html do
    redirect_to people_path
    flash[:error] = "Couldn't add person"
  end

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
    @person.address ||= Address.new
  end
  
  def siblings
    @person = object
  end
  
  def photo
    @person = object
  end
  
  def public_education_info
    @person = object
    @person.public_education_info ||= PublicEducationInfo.new
  end
end

