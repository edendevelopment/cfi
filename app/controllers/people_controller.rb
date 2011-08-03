class PeopleController < InheritedResources::Base
  respond_to :html

  def index
    respond_to do |format|
      format.html do
        if params[:search]
          @people = Person.search(params[:search])
        else
          @people = Person.alphabetical_group(params[:letter])
        end
      end
      format.js { render :template => 'people/index.erb.js' }
    end
  end
  
  create! do |success, failure|
    failure.html do 
      flash[:error] = "Couldn't add person"
      redirect_to people_url
    end
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
  
  def pupil
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
  
  def caretakers
    @person = object
  end
  
  def add_caretaker
    @person = object
    caretaker = Person.find(params[:person_id])
    @person.add_caretaker(caretaker)
    redirect_to(caretakers_person_path(@person))
  end
  
  def remove_caretaker
    @person = object
    caretaker = Person.find(params[:caretaker_id])
    @person.remove_caretaker(caretaker)
    redirect_to(caretakers_person_path(@person))
  end

private
  def object
    Person.find(params[:id])
  end
end

