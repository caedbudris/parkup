require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
    @comment = comments(:one)
    @post = posts(:one)
  end
  
  test 'should be invalid with no post' do
    assert_not @comment.valid?
  end
  
  test 'should be valid with a post' do
    @comment.post_id = @post.id
    assert @comment.valid?
  end
  
end
