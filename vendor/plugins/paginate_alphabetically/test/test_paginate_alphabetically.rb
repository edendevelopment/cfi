require File.expand_path(File.join(File.dirname(__FILE__), 'helper'))

class PaginateAlphabeticallyTest < ActiveSupport::TestCase
  def setup
    %w(one two Three four Five Six).map {|name| Thing.create!(:name => name)}
  end

  test "pagination letters" do
    assert_equal ['F', 'O', 'S', 'T'], Thing.pagination_letters
  end

  test "first letter" do
    assert_equal 'F', Thing.first_letter
  end

  test "first letter is alphabetical" do
    Thing.create!(:name => ' o noes a space :(')
    Thing.create!(:name => '1')
    Thing.create!(:name => '®')
    Thing.create!(:name => '$')
    assert_equal 'F', Thing.first_letter
  end

  test "first letter when there are no things" do
    Thing.destroy_all
    assert_equal 'A', Thing.first_letter
  end

  test "alphabetical group without specifying letter" do
    assert_equal ['Five', 'four'], Thing.alphabetical_group.map(&:name)
  end

  test "alphabetical group specifying letter" do
    assert_equal ['Three', 'two'], Thing.alphabetical_group('t').map(&:name)
  end

  test "class without pagination has no pagination methods" do
    assert_raise NoMethodError do
      Numpty.alphabetical_group
    end
  end

  def teardown
    Thing.destroy_all
  end
end
