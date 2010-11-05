class Households::PeopleController < ApplicationController
  before_filter :find_household
  before_filter :find_person
  
  def create
    @household.add_person(@person)
    respond_to do |wants|
      wants.html { redirect_to household_path(@household) }
      wants.js { render :partial => 'households/person', :object => @person, :locals => { :household => @household } }
    end
  end
  
  def destroy
    @household.remove_person(@person)
    respond_to do |wants|
      wants.html { redirect_to household_path(@household) }
      wants.js { render :nothing => true, :status => 200 }
    end
  end

private  
  def find_household
    @household = Household.find(params[:household_id])
  end
  
  def find_person
    @person = Person.find(params[:person_id] || params[:id])
  end
end
