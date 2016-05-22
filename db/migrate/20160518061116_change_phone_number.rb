class ChangePhoneNumber < ActiveRecord::Migration
  def change
  	rename_column :loan_applications, :PhoneNumber, :HomePhone
  end
end
