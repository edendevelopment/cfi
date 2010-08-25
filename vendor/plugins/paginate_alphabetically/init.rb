require File.expand_path(File.join(File.dirname(__FILE__), 'lib/paginate_alphabetically'))

ActiveRecord::Base.extend(PaginateAlphabetically)
