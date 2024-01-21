class CreatePromotions < ActiveRecord::Migration[7.1]
  def change
    create_table :promotions do |t|
      t.references :year, foreign_key: true
      t.references :classroom, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
