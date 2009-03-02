require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # Replace this with your real tests.
 
  
  test "event validates presence of name" do
    e = Event.new
    assert ! e.valid?
    assert e.errors.on(:name)
  end
  
  test "validates uniqness  of name" do
    e = Event.new(events(:one).attributes)
     assert ! e.valid?
    assert e.errors.on(:name)
  end
end
