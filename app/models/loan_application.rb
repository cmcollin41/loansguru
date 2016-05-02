require 'net/http'
class LoanApplication < ActiveRecord::Base
  after_create :format_names

  def post_to_site
    uri = URI.parse "https://olps.macfarlanegp.com/leadpost.aspx"
    request = Net::HTTP::Post.new uri.path
    request.body = application_xml_packet
    request.content_type = 'text/xml'
    response = Net::HTTP.new(uri.host, uri.port).start { |http| http.request request }
    response.body
  end  

  def application_xml_packet
    self.to_xml
  end  

  def format_names
    first = first_name.humanize
    last = last_name.humanize
    self.update(first_name: first)
    self.update(last_name: last)
  end

  def applicationURL
    "www.example.com"
  end  
end
