class CreateServiceItemPackages < ActiveRecord::Migration
  def change
    create_table :service_item_packages do |t|
      t.string :item_package
      t.decimal :price

      t.timestamps
    end
  end
end
