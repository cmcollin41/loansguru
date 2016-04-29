require 'net/http'
class LoanApplication < ActiveRecord::Base
  
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
end
