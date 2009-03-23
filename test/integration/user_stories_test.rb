require 'test_helper'

class UserStoriesTest < ActionController::IntegrationTest
  fixtures :all

 
  test "browse groups" do  
    event = events(:one)
    group = groups(:one)
    get "/groups"
    assert_response :success
    
    # querying   
    get "/groups" , :search_term => groups(:one).name
    assert_response :success
    assert_equal "/groups", path
    assert assigns(:location)
end

  test "browse events" do  
    event = events(:one)
    group = groups(:one)
    get "/events"
    assert_response :success
    
    # events  near you
    assert_select 'h1', "These are the  events I could  find near you"
    
    # querying   all events
    get "/events" , :search_term => "all"
    assert_response :success
    assert_equal "/events", path
    assert assigns(:location)
    assert_select 'h1', "Listing All Events"
end
  


end
