class Households::CommentsController < ApplicationController
  
  def create
    household = Household.find(params[:household_id])
    note = Comment.new(params[:comment])
    note.user = current_user
    household.comments << note unless note.comment.blank? && note.image.nil?
    redirect_to household_path(household)
  end
  
  def edit
    find_household_and_comment(params[:household_id], params[:id])
  end
  
  def update
    find_household_and_comment(params[:household_id], params[:id])
    if @comment.update_attributes(params[:comment])
      @comment.user = current_user
      flash[:notice] = "Successfully updated note."  
      redirect_to household_path(@household)
    else  
      render :action => 'edit'  
    end  
  end
  
  def destroy
    Comment.delete(params[:id])
    redirect_to household_path(Household.find(params[:household_id]))
  end

  private
  def find_household_and_comment(household_id, comment_id)
    @household = Household.find(household_id)
    @comment = Comment.find(comment_id)
  end
end
