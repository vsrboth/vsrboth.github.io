class CreateClientLoyaltyPointInvoices < ActiveRecord::Migration
  def change
    create_table :client_loyalty_point_invoices do |t|
      t.references :client, index: true
      t.references :invoice, index: true

      t.timestamps
    end
  end
end
