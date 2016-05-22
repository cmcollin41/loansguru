class RemovePhoneNumberFromLoans < ActiveRecord::Migration
  def change
  	remove_column :loan_applications, :PhoneNumber
  end
end
