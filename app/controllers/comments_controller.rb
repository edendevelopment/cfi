class CommentsController < ApplicationController
  resource_controller
  
  def create
    person = find_person(params[:person_id])
    person.add_comment(params[:comment], current_user) unless params[:comment].blank?
    redirect_to person_path(person)
  end
  
  def edit
    find_person_and_comment(params[:person_id], params[:id])
  end
  
  def update
    find_person_and_comment(params[:person_id], params[:id])
    @person.update_comment(@comment, params[:comment][:comment], current_user)
    redirect_to person_path(@person)
  end
  
  private
  def find_person(person_id)
    Person.find(person_id)
  end
  
  def find_person_and_comment(person_id, comment_id)
    @person = find_person(person_id)
    @comment = @person.comments.find(comment_id)
  end
end
