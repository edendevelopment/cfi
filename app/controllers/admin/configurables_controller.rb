class Admin::ConfigurablesController < AdminController
  include ConfigurableEngine::ConfigurablesController
  before_filter :authenticate_user!
end
