require 'rubygems'
require 'sequel'
require 'json'

ENV['APP_ENV'] ||= 'dev'

if ENV['APP_ENV'] == 'test'
  DB = Sequel.sqlite File.join(File.dirname(__FILE__), 'test.sqlite')
else
  DB = Sequel.sqlite File.join(File.dirname(__FILE__), 'db.sqlite')
end


class Sequel::Model
  def to_json
    self.hash.to_json
  end
end