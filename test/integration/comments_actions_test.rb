 require 'test_helper'
 
 class CommentActionsTest < ActionDispatch::IntegrationTest
 include Devise::Test::IntegrationHelpers

  test "adding a comment to a post" do
    post = articles(:post_one)
    post "/articles/#{post.id}/comments", params: {comment: {commenter: "commenter", body: "body",article_id: post.id}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
  
end