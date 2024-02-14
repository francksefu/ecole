class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.date :start_date
      t.date :end_date
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
