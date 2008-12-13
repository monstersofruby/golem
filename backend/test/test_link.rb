require File.join(File.dirname(__FILE__), 'helper_test.rb')

class TestLink < Test::Unit::TestCase
  context "Link tests" do
    setup do
      @link = Link.new(:title => 'Name', :url => 'http://google.com')
    end
    
    should "be valid with correct attributes" do
      assert_save @link
    end
    
    should "require :title to be set" do
      assert_bad_value(@link, :title, nil, "is not present")
    end
    
    should "require :url to be set" do
      assert_bad_value(@link, :url, nil, "is not present")
    end
    
    should "require :url format to be valid" do
      assert_bad_value(@link, :url, 'http', "is invalid")
    end
    
    should "#vote! should call update" do
      @link.expects(:update).with(:votes => 1)
      @link.vote!
    end
    
    should "increment votes when #vote! is called" do
      @link.vote!
      assert_equal(1, @link.votes)
    end
    
    should "update link" do
      id = @link.save.id
      Link.find(:id => id).update(:title => 'new_name')
      assert_equal('new_name', Link.find(:id => id).title)
    end
  end
end
