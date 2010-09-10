require File.expand_path(File.join(File.dirname(__FILE__), 'helper'))
include PaginateAlphabetically::ViewHelpers


module PaginateAlphabetically
  module ViewHelpers
    def request
      stub(:path => '')
    end
  end
end

class ViewHelperTest < ActiveSupport::TestCase
  def setup
    @result = alphabetically_paginate([Thing.create!(:name => 'a')])
  end

  test "it includes all the letters" do
    ('A'..'Z').each do |letter|
      assert @result.include?(letter)
    end
  end

  test "it links to the available letters" do
    assert @result.include?('<a href="?letter=A">')
  end

  test "it returns nothing when the collection is empty" do
    assert_equal "", alphabetically_paginate([])
  end

  test "it does not link to letters that have no content" do
    assert_equal false, @result.include?('href="?letter=B"')
  end

  test "it wraps the letters as list items" do
    assert @result.include?('<li>B</li>')
  end

  test "it wraps the result in a ul" do
    assert @result.include?('<ul class="pagination">')
  end
end
