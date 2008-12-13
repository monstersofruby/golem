require 'rubygems'
require 'ramaze'
require 'rake'
require 'pp'

module Kernel
  unless respond_to?(:debugger)
    def debugger
      puts "\n***** Debugger requested *****\n"
    end
  end
end

Restful_routes = {}

FileList[File.join(File.dirname(__FILE__), '*.rb')].each do |controller|
  require controller
end

# To make a PUT or DELETE request, use hidden input form.
#
# <form method="post" action="/admin/categories/1">
#   <input type="submit" value="Delete"/>
#   <input type="hidden" value="delete" name="method"/>
# </form>

# Lamda routing
Ramaze::Route('REST dispatch') do |path, request|
  puts 'MEEEK'
  pp [path, request]
  method = (request['method'] || request.request_method).upcase
  rewrite_path(path, method)
end

def rewrite_path(path, method)
  Restful_routes.each do |key, val|
    if md = path.match(key)
      puts val[method.to_sym] % md.to_a[1..-1]
      return val[method.to_sym] % md.to_a[1..-1]
    end
  end
end
