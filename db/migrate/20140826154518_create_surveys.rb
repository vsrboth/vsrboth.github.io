class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.references :client, index: true
      t.references :questionnaire, index: true

      t.timestamps
    end
  end
end
