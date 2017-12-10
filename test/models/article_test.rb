require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test "saving a post with user id a title and a post body should be valid as the article id should be automatically generated" do
    @article = Article.new
    @article.user_id = 1
    @article.title = "valid title"
    @article.post = "valid post body"
    assert @article.valid?
    assert @article.save
  end
  
  test "saving a post with an integer article id integer user id, a title and a post body should be valid" do
    @article = Article.new
    @article.id = 34567
    @article.user_id = 2345678
    @article.title = "A title"
    @article.post = "A post body"
    assert @article.valid?
    assert @article.save
  end
  
  test "saving a post with an article id, user id, a post body should be invalid as no title given" do
    @article = Article.new
    @article.id = 1
    @article.user_id = 1
    @article.post = "A post body"
    assert !@article.valid?
    assert !@article.save
  end
  
  test "saving a post with an article id, user id, a title should be invalid as no post body given" do
    @article = Article.new
    @article.id = 1
    @article.user_id = 1
    @article.title = "A title"
    assert !@article.valid?
    assert !@article.save
  end
  
  test "saving a post with an article id, user id should be invalid as not title or post body given" do
    @article = Article.new
    @article.id = 1
    @article.user_id = 1
    assert !@article.valid?
    assert !@article.save
  end
  
  test "saving a post with an article id, user id, a title longer than 50 characters and a post body should be invalid" do
    @article = Article.new
    @article.id = 1
    @article.user_id = 1
    @article.title = "This title is way too long. The title should be a maximum of 50 characters long."
    @article.post = "A post body"
    assert !@article.valid?
    assert !@article.save
  end

end
