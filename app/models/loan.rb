
require 'net/http'
class Loan < ActiveRecord::Base

  after_update :post_to_site, if: -> { required_for_step?(:add_bank)}

  cattr_accessor :form_steps do
    %w(add_loan add_applicant add_employer add_bank)
  end

  attr_accessor :form_step
  

  validates :RequestedAmount, :Zip, :FirstName, :LastName, :Email, presence: true, if: -> { required_for_step?(:add_loan)}
  validates :Address1, :City, :State, :SSN, :HomePhone, :DOB, presence: true, if: -> { required_for_step?(:add_applicant)}
  validates :EmployerName, :WorkPhone, :PayFrequency, :PayDay1, :PayDay2, :MonthlyIncome, :IncomeType, presence: true, if: -> { required_for_step?(:add_employer)}
  validates :AccountType, :RoutingNumber, :AccountNumber, presence: true, if: -> { required_for_step?(:add_bank)}

  validates_format_of :Zip, with: /\A[0-9]{5,5}\z/, on: :update, if: -> { required_for_step?(:add_loan)}
  validates_format_of :Email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :update, if: -> { required_for_step?(:add_loan)}
  validates_format_of :SSN, with: /\A[0-9]{9,9}\z/, on: :update, if: -> { required_for_step?(:add_applicant)}
  validates_format_of :HomePhone, with: /\A[0-9]{10,10}\z/, on: :update, if: -> { required_for_step?(:add_applicant)}
  validates_format_of :WorkPhone, with: /\A[0-9]{10,10}\z/, on: :update, if: -> { required_for_step?(:add_employer)}
  validates_format_of :RoutingNumber, with: /\A[0-9]{9,9}\z/, on: :update, if: -> { required_for_step?(:add_bank)}
  validates_format_of :AccountNumber, with: /\A[0-9]*\z/, on: :update, if: -> { required_for_step?(:add_bank)}

  enum PayFrequency: [ :WEEKLY, :BIWEEKLY, :SEMIMONTHLY, :MONTHLY ]
  enum IncomeType:   [ :EMPLOYMENT, :BENEFITS ]
  enum AccountType:  [ :CHECKING, :SAVINGS ]


  def post_to_site
      uri = "https://olps.macfarlanegp.com/leadpost.aspx"
      request = HTTParty.post uri, :body => application_xml_packet, :headers => {'Content-type' => 'text/xml'}
  end  

  def application_xml_packet
    packet_hash = self.as_json
    packet_hash['ApplicationURL'] = 'yourquid.com'
    packet_hash.to_xml
  end  


  def required_for_step?(step)
    # All fields are required if no form step is present
    return true if form_step.nil?
    # All fields from previous steps are required if the
    # step parameter appears before or we are on the current step
    return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
  end  
end
