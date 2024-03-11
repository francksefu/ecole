class CreateGiveWorks < ActiveRecord::Migration[7.1]
  def change
    create_table :give_works do |t|
      t.string :link
      t.references :date_evaluation, foreign_key: true
      t.datetime :end_date_time

      t.timestamps
    end
  end
end
