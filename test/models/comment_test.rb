require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  test "saving a comment with a commenter, a body, a article id and a user id should be valid" do
    @comment = Comment.new
    @comment.commenter = "Commenter"
    @comment.body = "body"
    @comment.article_id = 1
    @comment.user_id = 1
    assert @comment.valid?
    assert @comment.save
  end
  
  test "saving a comment with a commenter, a body, a article id should be valid" do
    @comment = Comment.new
    @comment.commenter = "Commenter"
    @comment.body = "body"
    @comment.article_id = 1
    assert @comment.valid?
    assert @comment.save
  end
  
  test "saving a comment with a commenter, a body, and a user id should be valid" do
    @comment = Comment.new
    @comment.commenter = "Commenter"
    @comment.body = "body"
    @comment.user_id = 1
    assert @comment.valid?
    assert @comment.save
  end

  test "saving a comment with a commenter a body should be valid" do
    @comment = Comment.new
    @comment.commenter = "Commenter"
    @comment.body = "body"
    assert @comment.valid?
    assert @comment.save
  end
  
  test "saving a comment with a commenter, a article id and a user id should be invalid" do
    @comment = Comment.new
    @comment.commenter = "Commenter"
    @comment.article_id = 1
    @comment.user_id = 1
    assert !@comment.valid?
    assert !@comment.save
  end
  
  test "saving a comment with a commenter, and a user id should be invalid" do
    @comment = Comment.new
    @comment.commenter = "Commenter"
    @comment.user_id = 1
    assert !@comment.valid?
    assert !@comment.save
  end
  
  test "saving a comment with a commenter, and a article id should be invalid" do
    @comment = Comment.new
    @comment.commenter = "Commenter"
    @comment.article_id = 1
    assert !@comment.valid?
    assert !@comment.save
  end
  
  test "saving a comment with only a commenter should be invalid" do
    @comment = Comment.new
    @comment.commenter = "Commenter"
    assert !@comment.valid?
    assert !@comment.save
  end
  
  
end
