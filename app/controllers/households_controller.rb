class HouseholdsController < InheritedResources::Base
  def create
    create! { households_path }
  end

  def destroy_image
    @household = Household.find_by_id(params[:id])
    @household.image.destroy!
    @household.image = nil
    @household.save!
    redirect_to household_path(@household)
  end
end
