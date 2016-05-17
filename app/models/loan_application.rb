# == Schema Information
#
# Table name: loan_applications
#
#  id             :integer          not null, primary key
#  zip_code       :integer          not null
#  street_address :string           not null
#  city           :string           not null
#  state          :string           not null
#  amount         :string           not null
#  application_ip :string           not null
#  home_phone     :string           not null
#  first_name     :string           not null
#  last_name      :string           not null
#  email_address  :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  campaign_id    :string
#  campaign_code  :string
#  sub_1          :string
#  lead_id        :string
#  work_phone     :string
#  ssn            :string
#  employer_name  :string
#  routing_number :string
#  account_number :string
#  date_of_birth  :date
#  payday_1       :date
#  payday_2       :date

#  pay_frequency  :integer
#  income_type    :integer
#  account_type   :integer

#  direct_deposit :boolean
#  is_military    :boolean
#

require 'net/http'
class LoanApplication < ActiveRecord::Base
  after_create :format_names, :post_to_site

  # Chris, here's a link for help with enums http://edgeapi.rubyonrails.org/classes/ActiveRecord/Enum.html, also feel free to 
  # ask me anything :)

  enum pay_frequency: [ :weekly, :biweekly, :semi_monthly, :monthly ]
  enum income_type:   [ :employment, :benefits ]
  enum account_type:  [ :checking, :saving ]


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
