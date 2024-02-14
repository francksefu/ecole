class CreateStudiesDirectors < ActiveRecord::Migration[7.1]
  def change
    create_table :studies_directors do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :phone
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
