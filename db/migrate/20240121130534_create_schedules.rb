class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.date :date
      t.integer :first_H
      t.integer :second_H
      t.integer :third_H
      t.integer :fourth_H
      t.integer :fifth_H
      t.integer :sixth_H
      t.integer :seven_H
      t.references :classroom, foreign_key: true
      t.timestamps
    end
  end
end
