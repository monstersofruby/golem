require File.join(File.dirname(__FILE__), 'helper_test.rb')

class TestLinks < Test::Unit::TestCase
  context "Links controller" do
    setup do
      @controller = LinksController.new
      @valid_params = {:title => 'google', :url => 'http://google.es'}
    end
    
    should "creates link" do
      @controller.stubs(:request).returns(stub(:params => @valid_params))
      @controller.create
      created_link = @controller.instance_variable_get('@link')
      assert created_link
      assert_equal("google", created_link.title)
      assert_equal("http://google.es", created_link.url)
    end
    
    should "find all" do
      result = [Link.new(:title=>'1')]
      Link.expects(:all).returns(result)
      assert_equal("[{\"title\":\"1\"}]", @controller.index)
    end
    
    should "shows link" do
      result = Link.new(:title=>'1')
      Link.expects(:find).with(:id => 1).returns(result)
      assert_equal("{\"title\":\"1\"}", @controller.show(1))
    end
    
    should "updates link" do
      @controller.stubs(:request).returns(stub(:params => {:title => '3'}))
      result = Link.new(:title=>'1')
      result.expects(:update).with(:title => '3').returns(Link.new(:title => 3))
      Link.expects(:find).with(:id => 1).returns(result)
      assert_equal("{\"title\":\"3\"}", @controller.update(1))
    end
  end
end
