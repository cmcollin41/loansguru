# == Schema Information
#
# Table name: loan_applications
#
#  id              :integer          not null, primary key
#  amount          :integer          not null
#  zip_code        :integer          not null
#  application_ip  :string           not null
#  phone_number    :string           not null
#  application_url :string           not null
#  first_name      :string           not null
#  last_name       :string           not null
#  email_address   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'net/http'
class LoanApplication < ActiveRecord::Base
  after_create :format_names, :post_to_site

  def post_to_site
    uri = "https://olps.macfarlanegp.com/leadpost.aspx"
    request = HTTParty.post uri, :body => application_xml_packet, :headers => {'Content-type' => 'text/xml'}
  end  

  def application_xml_packet
    packet_hash = self.as_json
    packet_hash['application_url'] = 'onlineloans.guru'
    packet_hash.to_xml
  end  

  def format_names
    first = first_name.humanize
    last = last_name.humanize
    self.update(first_name: first)
    self.update(last_name: last)
  end   
end
