class CreateEmployeeAttendants < ActiveRecord::Migration
  def change
    create_table :employee_attendants do |t|
      t.references :employee, index: true
      t.datetime :checkin_time
      t.string :checkin_status
      t.datetime :checkout_time
      t.string :checkout_status

      t.timestamps
    end
  end
end
