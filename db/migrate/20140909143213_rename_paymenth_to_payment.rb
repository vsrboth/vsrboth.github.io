class RenamePaymenthToPayment < ActiveRecord::Migration
  def change
    rename_column :invoices, :paymenth_method, :payment_method
  end
end
