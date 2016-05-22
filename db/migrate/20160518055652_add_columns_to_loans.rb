class AddColumnsToLoans < ActiveRecord::Migration
  def change
    change_table :loan_applications do |t|
      t.string :UserID
      t.string :Password
      t.string :ApplicationURL
    end  
  end
end
