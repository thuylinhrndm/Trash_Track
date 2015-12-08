require 'net/http'

class Api
  attr_accessor :url
  attr_accessor :uri

  def initialize
    @url = "http://localhost:3000/posts"
    @uri = URI.parse @url
  end

 def create(content="Default Content", rating=3, image_path="this is a test", address="Dublin, Ireland")
    xml_req =
    "<?xml version='1.0' encoding='UTF-8'?>
   <post>
  <content>#{content}</content>
  <rating>#{rating}</rating>
  <image-path>#{image_path}</image-path>
  <address>#{address}</address>
  </post>"
request = Net::HTTP::Post.new(@url)
    request.add_field "Content-Type", "application/xml"
    request.body = xml_req

    http = Net::HTTP.new(@uri.host, @uri.port)
    response = http.request(request)

    response.body
  end

  # Read can get all employees with no arguments or
  # get one employee with one argument.  For example:
  # api = Api.new
  # api.read 2 => one employee
  # api.read   => all employees
  def read(id=nil)
    request = Net::HTTP.new(@uri.host, @uri.port)

    if id.nil?
      response = request.get("#{@uri.path}.xml")
    else
      response = request.get("#{@uri.path}/#{id}.xml")
    end

    response.body
  end

# Update an employee using a predefined XML template as a REST request.
  def update(id, content="This is the 3th post", rating=3, image_path="this is a test", address="Cork, Ireland")
    xml_req =
    "<?xml version='1.0' encoding='UTF-8'?>
    <post>
    <id type='integer'>#{id}</id>
    <content>#{content}</content>
    <rating>#{rating}</rating>
    <image-path>#{image_path}</image-path>
    <address>#{address}</address>
    </post>"

    request = Net::HTTP::Put.new("#{@url}/#{id}.xml")
    request.add_field "Content-Type", "application/xml"
    request.body = xml_req

    http = Net::HTTP.new(@uri.host, @uri.port)
    response = http.request(request)

    # no response body will be returned
    case response
    when Net::HTTPSuccess
      return "#{response.code} OK"
    else
      return "#{response.code} ERROR"
    end
  end

  # Delete an employee with an ID using HTTP Delete
  def delete(id)
    request = Net::HTTP::Delete.new("#{@url}/#{id}.xml")
    http = Net::HTTP.new(@uri.host, @uri.port)
    response = http.request(request)

    # no response body will be returned
    case response
    when Net::HTTPSuccess
      return "#{response.code} OK"
    else
      return "#{response.code} ERROR"
    end
  end


end
