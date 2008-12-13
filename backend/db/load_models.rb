require 'rubygems'
require 'rake'
require File.join(File.dirname(__FILE__), 'initialize.rb')

FileList[File.join(File.dirname(__FILE__), '../models/*.rb')].each do |controller|
  require controller
end
