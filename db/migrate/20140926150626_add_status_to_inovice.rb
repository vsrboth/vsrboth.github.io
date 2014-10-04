class AddStatusToInovice < ActiveRecord::Migration
  def change
    add_column :invoices, :status, :string, default: 'unpaid'
  end
end
