class PeopleController < ApplicationController
  resource_controller
  
  create.failure.wants.html do
    redirect_to people_path
    flash[:error] = "Couldn't add person"
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
  
  def obligations
    @person = object
    @person.obligations ||= Obligations.new
  end
  
  def social_development_info
    @person = object
    @person.social_development_info ||= SocialDevelopmentInfo.new
  end
  
  def add_sibling
    @person = object
    @person.add_sibling(Person.find(params[:person_id]))
    redirect_to siblings_person_path(object)
  end
  
  def remove_sibling
    @person = object
    @person.remove_sibling(Person.find(params[:sibling_id]))
    redirect_to siblings_person_path(@person)
  end
end

