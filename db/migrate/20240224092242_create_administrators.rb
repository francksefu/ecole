class CreateAdministrators < ActiveRecord::Migration[7.1]
  def change
    create_table :administrators do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.date :date_of_birth
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
