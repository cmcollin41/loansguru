class AddPhoneNumberToLoans < ActiveRecord::Migration
  def change
  	add_column :loan_applications, :PhoneNumber, :integer
  end
end
