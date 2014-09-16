class AddEmployeeIdToCommunication < ActiveRecord::Migration
  def change
    add_reference :communications, :employee, index: true
  end
end
