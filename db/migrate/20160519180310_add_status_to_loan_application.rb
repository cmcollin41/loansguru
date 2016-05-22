class AddStatusToLoanApplication < ActiveRecord::Migration
  def change
    add_column :loan_applications, :status, :string
  end
end
