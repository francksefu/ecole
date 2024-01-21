class CreateDetailPaiementClassrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :detail_paiement_classrooms do |t|
      t.references :classroom, foreign_key: true
      t.references :detail_paiement, foreign_key: true
      t.references :year, foreign_key: true
      t.timestamps
    end
  end
end
