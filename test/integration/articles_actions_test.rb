require 'test_helper'

class ArticleActionsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "posting a post without being logged in" do
    sign_out users(:user_one)
    get "/articles/new"
    assert_redirected_to new_user_session_path # should perform a 302 redirect to login page
  end
  
  test "editting a post after being logged in should be success" do
    post = articles(:post_one)
    sign_in users(:user_one)
    get "/articles/#{post.id}/edit"
    assert_response :success
  end
  
    test "editing a post without being logged in" do
   post = articles(:post_one)
   sign_out users(:user_one)
   get "/articles/#{post.id}/edit"
   assert_redirected_to new_user_session_path # should perform a 302 redirect to login page
  end

  test "editing a post made by someone else" do
    post = articles(:post_one)
    sign_in users(:user_two)
    get "/articles/#{post.id}/edit"
    assert_redirected_to article_path(post)
    assert_equal 'You are not allowed to edit this post.', flash[:notice] 
  end
  
  test "deleting a post without being logged in" do
    post = articles(:post_one)
    sign_out users(:user_one)
    sign_out users(:user_two)
    delete "/articles/#{post.id}"
    assert_redirected_to new_user_session_path
  end
  
  test "deleting a post while being logged in should be success" do
    post = articles(:post_one)
    sign_in users(:user_one)
    delete "/articles/#{post.id}"
    assert_response(302, 'OK')
    assert_equal 'Post was successfully destroyed.', flash[:notice] 
  end
  
  test "deleting a post made by someone else" do
    post = articles(:post_one)
    sign_in users(:user_two)
    delete "/articles/#{post.id}"
    assert_equal 'You are not allowed to destroy this post.', flash[:notice] 
  end

  test "showing all posts should be a success" do
    get "/"
    assert_response :success
  end

  test "showing the post should be success" do
    post = articles(:post_one)
    get "/articles/#{post.id}"
    assert_response :success
  end

  test "showing the create a new post page after being logged in should be a success" do
    sign_in users(:user_one)
    get "/articles/new"
    assert_response :success
  end

end
