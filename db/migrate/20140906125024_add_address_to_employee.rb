class AddAddressToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :address, :string
  end
end
