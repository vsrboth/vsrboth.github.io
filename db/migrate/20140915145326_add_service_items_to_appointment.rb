class AddServiceItemsToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :service_item_ids, :string
  end
end
