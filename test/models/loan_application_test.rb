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

require 'test_helper'

class LoanApplicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
