require 'rubygems'
require 'rake'
require File.join(File.dirname(__FILE__), 'initialize.rb')

FileList[File.join(File.dirname(__FILE__), '../models/*.rb')].each do |model|
  require model
  class_name = eval(File.basename(model).gsub(/\.rb/,'').camelize)
  class_name.create_table!
end
