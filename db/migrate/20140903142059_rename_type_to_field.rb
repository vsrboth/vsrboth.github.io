class RenameTypeToField < ActiveRecord::Migration
  def change
    rename_column :communications, :type, :field
  end
end
