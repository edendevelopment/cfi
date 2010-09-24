class ApplicationController < ActionController::Base
  include InheritedResources::DSL
  
  protect_from_forgery
  before_filter :authenticate_user!
  helper :all
end
