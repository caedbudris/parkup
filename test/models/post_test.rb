require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @post = Post.new(title: 'Test Title', link: 'http://www.example.com/', content: 'example content', rating: 1, category: 'news')
  end
  
  test 'post should be valid' do
    assert @post.valid?
  end
  
  test 'title should be present' do
    @post.title = ''
    assert_not @post.valid?
  end
  
  test 'title should not be too short' do
    @post.title = 'a' * 7
    assert_not @post.valid?
  end
  
  test 'title should not be too long' do
    @post.title = 'a' * 81
    assert_not @post.valid?
  end
  
  test 'link does not have to be present' do
    @post.link = nil
    assert @post.valid?
  end
  
  test 'bad links should not be valid' do
    @post.link = 'example.com'
    assert_not @post.valid?
  end
  
  test 'content does not have to be present' do
    @post.content = ''
    assert @post.valid?
  end
  
  test 'type should be present' do
    @post.category = ''
    assert_not @post.valid?
  end
end
