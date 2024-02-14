class CreateEvaluations < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluations do |t|
      t.float :point
      t.float :maximum
      t.datetime :date
      t.references :promotion, foreign_key: true
      t.references :course, foreign_key: true
      t.references :periode, foreign_key: true
      t.references :year, foreign_key: true
      t.timestamps
    end
  end
end
