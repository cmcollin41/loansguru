# == Schema Information
#
# Table name: loans
#
#  id                   :integer          not null, primary key
#  Zip                  :integer
#  Address1             :string
#  City                 :string
#  State                :string
#  RequestedAmount      :string
#  ApplicationIP        :string
#  FirstName            :string
#  LastName             :string
#  Email                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  CampaignID           :integer
#  CampaignCode         :string
#  Sub1                 :string
#  LeadID               :string
#  SSN                  :integer
#  EmployerName         :string
#  RoutingNumber        :integer
#  AccountNumber        :integer
#  DOB                  :date
#  PayDay1              :date
#  PayDay2              :date
#  WorkPhone            :string
#  PayFrequency         :integer
#  IncomeType           :integer
#  AccountType          :integer
#  DirectDeposit        :boolean
#  IsMilitary           :boolean
#  UserID               :string
#  Password             :string
#  ApplicationURL       :string
#  HomePhone            :string
#  MonthlyIncome        :integer
#  status               :string
#  ReferenceId          :string
#  ApplicationDate      :string
#  sub2                 :string
#  Sub3                 :string
#  Address2             :string
#  MobilePhone          :string
#  HomeStatus           :string
#  DriversLiscense      :string
#  DriversLiscenseState :string
#  MonthsAtAddress      :string
#  JobTitle             :string
#  WorkExtension        :string
#  ContactName          :string
#  ContactPhone         :string
#  ContactExtension     :string
#  MonthsEmployed       :string
#  BankName             :string
#  Ref1Name             :string
#  Ref1Phone            :string
#  Ref2Name             :string
#  Ref2Phone            :string
#

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
      puts "\n\n\n\n\n\n#{request}\n\n\n\n\n\n\n\n\n"
  end  

  def application_xml_packet
    generate_hash_for_user
  end  

  def generate_hash_for_user
    packet_hash = Hash.new
    add_to_hash(packet_hash, "Authentication", %w(UserId Password))
    add_to_hash(packet_hash, "Application", %w(CampaignID CampaignCode ReferenceID ApplicationURL ApplicationIP ApplicationDate RequestedAmmount Sub1 Sub2 Sub3 Sub4 LeadID))
    add_to_hash(packet_hash, "Applicant", %w(FirstName LastName Address1 Address2 City State Zip SSN HomePhone MobilePhone Email DOB HomeStatus DriversLicense DriversLicenseState MonthsAtAddress))
    add_to_hash(packet_hash, "Employment", %w(EmployerName JobTitle WorkPhone WorkExtension PayFrequency DirectDeposit PayDay1 PayDay2 MonthlyIncome IncomeType IsMilitary ContactName ContactPhone ContactExtension MonthsEmployed))
    add_to_hash(packet_hash, "BankAccount", %w(BankName AccountType RoutingNumber AccountNumber))
    add_to_hash(packet_hash, "Reference", %w(Ref1Name Ref1Phone Ref2Name Ref2Phone))
    packet_hash["Application"]['ApplicationURL'] = 'yourquid.com'
    return packet_hash.to_xml(root: "CashAdvancePosts")
  end  

  def add_to_hash(hash_to_add_to, element_type, elements)
    hash_to_add_to[element_type] = Hash.new
    elements.each do |element|
      hash_to_add_to[element_type][element] = self[element].to_s
    end  
  end  


  def required_for_step?(step)
    # All fields are required if no form step is present
    return true if form_step.nil?
    # All fields from previous steps are required if the
    # step parameter appears before or we are on the current step
    if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
       # puts "\n\n\n\n*required_for_step* method is working\n\n\n\n\n\n"
       return true
    end   
  end  
end
