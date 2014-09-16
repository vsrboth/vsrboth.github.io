class CreateAccountRoles < ActiveRecord::Migration
  def change
    create_table :account_roles do |t|
      t.references :account, index: true
      t.references :role, index: true

      t.timestamps
    end
  end
end
