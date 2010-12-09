class NotesController < ApplicationController
  
  def create
    household = Household.find(params[:household_id])
    household.add_note(params[:note], current_user) unless params[:note].blank?
    redirect_to household_path(household)
  end
  
  def edit
    find_household_and_note(params[:household_id], params[:id])
  end
  
  def update
    find_household_and_note(params[:household_id], params[:id])
    @household.update_note(@note, params[:comment][:comment], current_user)
    redirect_to household_path(@household)
  end
  
  private
  def find_household_and_note(household_id, note_id)
    @household = Household.find(household_id)
    @note = @household.comments.find(note_id)
  end
end
