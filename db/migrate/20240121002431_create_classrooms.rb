class CreateClassrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :classrooms do |t|
      t.string :section
      t.string :name
      t.string :classement

      t.timestamps
    end
  end
end
