class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :client, index: true
      t.references :employee, index: true
      t.string :title
      t.string :description
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
