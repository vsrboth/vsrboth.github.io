class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :birth_date
      t.string :occupation
      t.string :address
      t.text :remark

      t.timestamps
    end
  end
end
