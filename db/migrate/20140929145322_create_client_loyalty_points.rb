class CreateClientLoyaltyPoints < ActiveRecord::Migration
  def change
    create_table :client_loyalty_points do |t|
      t.references :client, index: true
      t.integer :point

      t.timestamps
    end
  end
end
