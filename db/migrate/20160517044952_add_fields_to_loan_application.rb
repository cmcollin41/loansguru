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
      t.rename :phone_number, :home_phone
      t.string :campaign_id
      t.string :campaign_code
      t.string :sub_1
      t.string :lead_id
      t.string :work_phone
      t.string :ssn
      t.string :employer_name
      t.string :routing_number
      t.string :account_number

      t.date :date_of_birth
      t.date :payday_1
      t.date :payday_2

      t.integer :pay_frequency
      t.integer :income_type
      t.integer :account_type

      t.boolean :direct_deposit
      t.boolean :is_military
    end  
  end
end
