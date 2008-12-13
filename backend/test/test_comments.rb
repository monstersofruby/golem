require File.join(File.dirname(__FILE__), 'helper_test.rb')

class TestComments < Test::Unit::TestCase
  context "Comments controller" do
    setup do
      @controller = CommentsController.new
      @valid_params = {:author => 'Person', :body => 'cuerpo!'}
    end
    
    should "creates link" do
      @controller.stubs(:request).returns(stub(:params => @valid_params))
      @controller.create(1)
      created_comment = @controller.instance_variable_get('@comment')
      assert created_comment
      assert_equal("Person", created_comment.author)
      assert_equal("cuerpo!", created_comment.body)
      assert_equal(1, created_comment.link_id)
    end
    
    should "find all" do
      comment = Comment.new(:author=>'1')
      comment.stubs(:id).returns(1)
      result = [comment]
      Comment.expects(:all).with(:link_id => 1).returns(result)
      assert_equal("{\"records\":[{\"author\":\"1\"}],\"ids\":[1]}", @controller.list(1))
    end
  end
end
