class CreateEvaluates < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluates do |t|
      t.integer :promotion_id
      t.integer :course_id
      t.float :point
      t.integer :year_id
      t.integer :periode_id

      t.timestamps
    end
  end
end
