require File.join(File.dirname(__FILE__), 'helper_test.rb')

class TestComment < Test::Unit::TestCase
  context "Values tests" do
    setup do
      @comment = Comment.new(:author => 'Me', :body => 'bla bla', :link_id => 1)
    end
    
    should "be valid with correct attributes" do
      assert_save @comment
    end
    
    should "require :author to be set" do
      assert_bad_value(@comment, :author, nil, "is not present")
    end
    
    should "require :body to be set" do
      assert_bad_value(@comment, :body, nil, "is not present")
    end
    
    should "require :link_id to be set" do
      assert_bad_value(@comment, :link_id, nil, "is not present")
    end
  end
end
