class CreatePromotions < ActiveRecord::Migration[7.1]
  def change
    create_table :promotions do |t|
      t.integer :year_id
      t.integer :classroom_id
      t.integer :student_id

      t.timestamps
    end
  end
end
