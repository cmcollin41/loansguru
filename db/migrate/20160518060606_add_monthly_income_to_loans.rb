class AddMonthlyIncomeToLoans < ActiveRecord::Migration
  def change
    add_column :loan_applications, :MonthlyIncome, :integer
  end
end
