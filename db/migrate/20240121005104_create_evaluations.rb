class CreateEvaluations < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluations do |t|
      t.float :point
      t.float :maximum
      t.datetime :date

      t.timestamps
    end
  end
end
