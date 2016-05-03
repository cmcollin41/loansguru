class CreateLoanApplications < ActiveRecord::Migration
  def change
    create_table :loan_applications do |t|
      t.integer :zip_code, null: false
      t.string :amount, null: false
      t.string :application_ip, null: false
      t.string :phone_number, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email_address, null: false

      t.timestamps null: false
    end
  end
end
