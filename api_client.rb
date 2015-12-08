require './lib/api.rb'
require 'nokogiri'

# CRUD example with an api

def list_posts(api_object)
  puts "Current Post:"
  doc = Nokogiri::XML.parse api_object.read
  contents= doc.xpath('posts/post/content').collect {|e| e.text }
  puts contents.join(", ")
  puts ""
end

api = Api.new
list_posts(api)

# Create
puts "Creating someone post..."
api.create "Thuy Linh"
list_posts(api)

# Read one and do nothing with it
api.read 1

# Read all and get valid IDs
doc = Nokogiri::XML.parse api.read
ids = doc.xpath('posts/post/id').collect {|e| e.text }

