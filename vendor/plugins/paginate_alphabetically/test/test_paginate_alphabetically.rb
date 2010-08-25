require File.expand_path(File.join(File.dirname(__FILE__), 'helper'))

class Thing < ActiveRecord::Base
  paginate_alphabetically :by => :name
end

class Numpty < ActiveRecord::Base
end

class PaginateAlphabeticallyTest < ActiveSupport::TestCase
  def setup
    %w(One Two Three Four Five Six).map {|name| Thing.create!(:name => name)}
  end

  def test_pagination_letters
    assert_equal ['F', 'O', 'S', 'T'], Thing.pagination_letters
  end

  def test_first_letter
    assert_equal 'F', Thing.first_letter
  end

  def test_first_letter_when_there_are_no_things
    Thing.destroy_all
    assert_equal 'A', Thing.first_letter
  end

  def test_alphabetical_group_without_specifying_letter
    assert_equal ['Five', 'Four'], Thing.alphabetical_group.map(&:name)
  end

  def test_alphabetical_group_specifying_letter
    assert_equal ['Three', 'Two'], Thing.alphabetical_group('t').map(&:name)
  end

  def test_class_without_pagination_has_no_pagination_methods
    assert_raise NoMethodError do
      Numpty.alphabetical_group
    end
  end

  def teardown
    Thing.destroy_all
  end
end
