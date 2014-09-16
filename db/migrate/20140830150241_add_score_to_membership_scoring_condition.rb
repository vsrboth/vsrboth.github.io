class AddScoreToMembershipScoringCondition < ActiveRecord::Migration
  def change
    add_column :membership_scoring_conditions, :score, :integer
  end
end
