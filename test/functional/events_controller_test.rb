require 'test_helper'

class EventsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index, :search_term=>'all'
    assert_response :success 
    assert_not_nil assigns(:events)
    assert_not_nil assigns(:location)
  end
  
   test " events  near you" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events) 
    assert_not_nil assigns(:location)
    assert_select 'h1', "These are the  events I could  find near you" 
  end
  

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, :event => { 
        :name => 'whatever',
        :location_id=>'1',
        :group_id=>'1',
        :end_date=>'2009-01-01',
        :start_date=>'2008-01-01',
        :description=>'whatever'
        }
      
    end

    assert_redirected_to event_path(assigns(:event))
  end


 test "should  create event missing data" do 
  post :create, :event => { 
        :name => 'whatever',
        :group_id=>'1',
        :end_date=>'2009-01-01',
        :start_date=>'2008-01-01',
   }
    assert_response :success
    assert_template "new"  
    assert_select "div#errorExplanation"
  end
  
  test "should show event" do
    get :show, :id => events(:one).id
    assert_response :success
  end


  test "should show event with map" do
    get :show, :id => events(:one).id
    assert_select "div#map_div_id"
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => events(:one).id
    assert_response :success
  end

  test "should update event" do
    put :update, :id => events(:one).id, :event => { }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, :id => events(:one).id
    end

    assert_redirected_to events_path
  end
end
