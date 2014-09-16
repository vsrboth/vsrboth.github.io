class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :client, index: true
      t.references :employee, index: true
      t.string :appointment_date
      t.string :appointment_time

      t.timestamps
    end
  end
end
