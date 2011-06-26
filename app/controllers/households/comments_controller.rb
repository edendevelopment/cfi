class Households::CommentsController < InheritedResources::Base
  belongs_to :household

  def create
    create! do 
      @comment.user = current_user
      @comment.save!
      household_path(@household) 
    end
  end

  def update
    update! { household_path(@household) }
  end

  def destroy
    destroy! { household_path(@household) }
  end
end
