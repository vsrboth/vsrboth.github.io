class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :client, index: true
      t.decimal :deposit
      t.string :payment_method
      t.decimal :discount

      t.timestamps
    end
  end
end
