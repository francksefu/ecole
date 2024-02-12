class CreateDateEvaluations < ActiveRecord::Migration[7.1]
  def change
    create_table :date_evaluations do |t|
      t.date :date
      t.float :maximum
      t.references :classroom_course
      t.references :periode

      t.timestamps
    end
  end
end
