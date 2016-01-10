require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  
  def setup
    @post = posts(:one)
    @comment = comments(:one)
    @comment.post_id = @post.id 
  end
  
  test "should create a comment" do
    assert_difference '@post.comments.count', +1 do
      post :create, comment: { content: 'new comment', post_id: @post.id }
    end
    assert_redirected_to @post
  end
  
  test "should destroy a comment" do
    assert_difference 'Comment.count', -1 do
      @comment.destroy
    end
  end
  
end
