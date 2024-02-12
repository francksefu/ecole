class CreateEvaluates < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluates do |t|
      t.float :point
      t.references :date_evaluation
      t.references :promotion
      t.timestamps
    end
  end
end
