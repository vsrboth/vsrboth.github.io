class CreateMembershipScoringConditions < ActiveRecord::Migration
  def change
    create_table :membership_scoring_conditions do |t|
      t.integer :first_operand
      t.string :operator
      t.integer :second_oeprand

      t.timestamps
    end
  end
end
