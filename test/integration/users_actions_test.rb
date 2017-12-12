require 'test_helper'

class CommentPostingFlowsTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers

 # we have only checked that the pages that devise provides
 # are accessible via our application.
 # it is not our responsibility to carry out init tests on 
 # third party code
 
  test "while logged in showing the forgot passwprd page should take to root/index" do
 	user = users(:user_one)
 	sign_in user
 	get "/users/password/new"
 	assert_response :redirect
 	assert_equal 'You are already signed in.', flash[:alert]
 end
 
  test "showing the forgot password page" do
 	get "/users/password/new"
 	assert_response :success
 end
 
  test "when logged in showing the edit user details page" do
 	get "/users/edit"
 	assert_redirected_to new_user_session_path
 	assert_equal 'You need to sign in or sign up before continuing.', flash[:alert]
 end
 
  test "showing page for edit user details" do
 	user = users(:user_one)
 	sign_in user
 	get "/users/edit"
 	assert_response :success
 end
 
  test "showing page for signing up page" do
 	get "/users/sign_up"
 	assert_response :success
 end

 test "showing page for signing in" do
 	get "/users/sign_in"
 	assert_response :success
 end

end
