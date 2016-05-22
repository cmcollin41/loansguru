class RemoveNullFromLoanApplications < ActiveRecord::Migration
  def change
  	change_column :loan_applications, :Zip, :integer, null: true
  	change_column :loan_applications, :Address1, :string, null: true
  	change_column :loan_applications, :City, :string, null: true
  	change_column :loan_applications, :State, :string, null: true
  	change_column :loan_applications, :RequestedAmount, :string, null: true
  	change_column :loan_applications, :ApplicationIP, :string, null: true
  	change_column :loan_applications, :FirstName, :string, null: true
  	change_column :loan_applications, :LastName, :string, null: true
  	change_column :loan_applications, :Email, :string, null: true
  end
end
