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

require 'test_helper'

class LoanApplicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
