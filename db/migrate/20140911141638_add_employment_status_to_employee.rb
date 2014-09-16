class AddEmploymentStatusToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :employment_status, :boolean, default: true
  end
end
