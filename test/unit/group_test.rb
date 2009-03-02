require 'test_helper'

class GroupTest < ActiveSupport::TestCase
 
  test "group validates presence of name" do
    g = Group.new
    assert ! g.valid?
    assert g.errors.on(:name)
  end

  test "happy case group" do
    g = groups(:one)
    assert  g.valid? 
  end
  
  test "validates uniqness  of name" do
    g = Group.new(groups(:one).attributes)
     assert ! g.valid?
    assert g.errors.on(:name)
  end
  
 
  
  
end
