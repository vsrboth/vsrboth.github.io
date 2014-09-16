class CreateServiceItems < ActiveRecord::Migration
  def change
    create_table :service_items do |t|
      t.references :category, index: true
      t.string :item
      t.decimal :price

      t.timestamps
    end
  end
end
