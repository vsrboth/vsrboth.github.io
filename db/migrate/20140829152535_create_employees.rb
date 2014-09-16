class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :code
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :birthdate
      t.references :position, index: true

      t.timestamps
    end
  end
end
