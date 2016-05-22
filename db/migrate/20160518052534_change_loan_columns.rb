class ChangeLoanColumns < ActiveRecord::Migration
  def change
  	rename_column :loan_applications, :email_address, :Email
  	rename_column :loan_applications, :last_name, :LastName
  	rename_column :loan_applications, :first_name, :FirstName
  	rename_column :loan_applications, :phone_number, :PhoneNumber
  	rename_column :loan_applications, :application_ip, :ApplicationIP
  	rename_column :loan_applications, :amount, :RequestedAmount
  	rename_column :loan_applications, :state, :State
  	rename_column :loan_applications, :city, :City 
  	rename_column :loan_applications, :street_address, :Address1
  	rename_column :loan_applications, :zip_code, :Zip 
  end
end
