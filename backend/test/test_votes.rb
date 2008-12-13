require File.join(File.dirname(__FILE__), 'helper_test.rb')

class TestVotes < Test::Unit::TestCase
  context "Votes controller" do
    setup do
      @controller = VotesController.new
      @link = Link.new({:title => 'google', :url => 'http://google.es'})
    end
    
    should "add votes" do
      @link.expects(:vote!)
      Link.expects(:find).with(:id => 1).returns(@link)
      @controller.create(1)
    end
  end
end
