ENV['APP_ENV'] = 'test'
require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'shoulda/active_record'
require 'mocha'
require File.join(File.dirname(__FILE__), '../db/load_models.rb')
require File.join(File.dirname(__FILE__), '../controllers/base.rb')

class Test::Unit::TestCase
  # ...
  def teardown
  end
end
