class ChangePhoneNumberToString < ActiveRecord::Migration
  def change
  	change_column :loans, :HomePhone, :string 
  	change_column :loans, :WorkPhone, :string 
  end
end
