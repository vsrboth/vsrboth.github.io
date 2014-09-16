class RenameSecondOeperandToSecondOperand < ActiveRecord::Migration
  def change
    rename_column :membership_scoring_conditions, :second_oeprand, :second_operand
  end
end
