class AddAllColumsToLoans < ActiveRecord::Migration
  def change
    change_table :loans do |t|
      t.string :ReferenceId
      t.string :ApplicationDate
      t.string :sub2
      t.string :Sub3
      t.string :Address2
      t.string :MobilePhone
      t.string :HomeStatus
      t.string :DriversLiscense
      t.string :DriversLiscenseState
      t.string :MonthsAtAddress
      t.string :JobTitle
      t.string :WorkExtension
      t.string :ContactName
      t.string :ContactPhone
      t.string :ContactExtension
      t.string :MonthsEmployed
      t.string :BankName
      t.string :Ref1Name
      t.string :Ref1Phone
      t.string :Ref2Name
      t.string :Ref2Phone
    end  
  end
end
