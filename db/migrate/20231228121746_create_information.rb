class CreateInformation < ActiveRecord::Migration[7.1]
  def change
    create_table :information do |t|
      t.string :source
      t.string :destination
      t.text :contenu
      t.datetime :date

      t.timestamps
    end
  end
end
