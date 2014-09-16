class CreateCommunications < ActiveRecord::Migration
  def change
    create_table :communications do |t|
      t.references :client, index: true
      t.string :type
      t.string :value

      t.timestamps
    end
  end
end
