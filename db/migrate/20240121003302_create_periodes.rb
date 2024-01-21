class CreatePeriodes < ActiveRecord::Migration[7.1]
  def change
    create_table :periodes do |t|
      t.string :name
      t.integer :during_time

      t.timestamps
    end
  end
end
