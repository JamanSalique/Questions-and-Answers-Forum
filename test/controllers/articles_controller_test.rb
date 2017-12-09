require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  
 # we only have one test case for the controller as we
 # have made many more test cases elsewhere more
 # specifically in the articles actions test which are integration tests.
 #see that integration tests for more test cases.
  
  test "creating a new post when you are signed out" do
    user = users(:user_one)
    sign_out user
    get :create, params: {article: {title: "Test1", post: "body1",user_id: user.id}}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end


end
