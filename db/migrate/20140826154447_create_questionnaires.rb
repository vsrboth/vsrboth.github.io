class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
