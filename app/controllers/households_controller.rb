class HouseholdsController < InheritedResources::Base
  def create
    create! { households_path }
  end
end
