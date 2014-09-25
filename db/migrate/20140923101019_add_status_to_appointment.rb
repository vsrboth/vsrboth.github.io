class AddStatusToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :status, :string, default: 'inactive'
  end
end
