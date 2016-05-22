class RenameLoansApplicationTable < ActiveRecord::Migration
   def change
     rename_table :loan_applications, :loans
   end 
end
