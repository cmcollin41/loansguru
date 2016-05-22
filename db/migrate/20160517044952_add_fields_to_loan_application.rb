#  zip_code       :integer          not null
#  street_address :string           not null
#  city           :string           not null
#  state          :string           not null
#  amount         :string           not null
#  application_ip :string           not null
#  phone_number   :string           not null
#  first_name     :string           not null
#  last_name      :string           not null
#  email_address  :string           not null

class AddFieldsToLoanApplication < ActiveRecord::Migration
  def change
    change_table :loan_applications do |t|
      t.integer :CampaignID
      t.string :CampaignCode
      t.string :Sub1
      t.string :LeadID
      t.integer :SSN
      t.string :EmployerName
      t.integer :RoutingNumber
      t.integer :AccountNumber

      t.date :DOB
      t.date :PayDay1
      t.date :PayDay2

      t.integer :WorkPhone
      t.integer :PayFrequency
      t.integer :IncomeType
      t.integer :AccountType

      t.boolean :DirectDeposit
      t.boolean :IsMilitary
    end  
  end
end
