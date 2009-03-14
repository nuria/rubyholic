require 'test_helper'
require 'flexmock/test_unit'

class GroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groups)
  end


  test " there is  some  pagination" do
    get :index
    assert_response :success
    assert_tag(:tag => 'div',
               :attributes => { :class => 'pagination'})
               
    assert_tag(:tag => 'div',:attributes => { :class => 'group_name'})
    
  end
  
 


  test "should create group with name url only" do
    assert_difference('Group.count') do
      post :create, :group => {:name => 'whatever',:url=>'http://blah'}
   
   end 
    assert_redirected_to group_path(assigns(:group))
  end


 test "should create group with name description url" do
    assert_difference('Group.count') do
      post :create, :group => {
                       :name => 'whatever',
                       :description =>'whatever',
                       :url =>'http://whatever'
                      }
    end

    assert_redirected_to group_path(assigns(:group))
  end



  test "should show group" do
    get :show, :id => groups(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => groups(:one).id
    assert_response :success
  end

  test "should update group" do
    put :update, :id => groups(:one).id, :group => { }
    assert_redirected_to group_path(assigns(:group))
  end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete :destroy, :id => groups(:one).id
    end

    assert_redirected_to groups_path
  end
end
