class CreateDetailPaiementClassrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :detail_paiement_classrooms do |t|
      t.integer :classroom_id
      t.integer :detail_paiement_id
      t.integer :year_id

      t.timestamps
    end
  end
end
