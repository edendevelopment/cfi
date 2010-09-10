require File.expand_path(File.join(File.dirname(__FILE__), 'lib/paginate_alphabetically'))
require File.expand_path(File.join(File.dirname(__FILE__), 'lib/view_helpers'))

ActiveRecord::Base.extend(PaginateAlphabetically)
ActionView::Base.class_eval { include PaginateAlphabetically::ViewHelpers }
