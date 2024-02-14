class CreateObservationDisciplinaries < ActiveRecord::Migration[7.1]
  def change
    create_table :observation_disciplinaries do |t|
      t.date :date
      t.text :observation
      t.references :discipline_director, foreign_key: true
      t.references :promotion, foreign_key: true
      t.timestamps
    end
  end
end
