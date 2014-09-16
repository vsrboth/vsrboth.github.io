class CreateInvoiceDetails < ActiveRecord::Migration
  def change
    create_table :invoice_details do |t|
      t.references :invoice, index: true
      t.references :employee, index: true
      t.references :service_item, index: true
      t.decimal :new_price
      t.string :discount_type
      t.decimal :discount_value

      t.timestamps
    end
  end
end
