require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
   test "location validates presence of name" do
    l = Location.new
    assert ! l.valid?
    assert l.errors.on(:name)
  end
  
   test "validates uniqness  of name" do
    l = Location.new(locations(:one).attributes)
     assert ! l.valid?
    assert l.errors.on(:name)
  end
end
