class AddYearToDetailPaiement < ActiveRecord::Migration[7.1]
  def change
    remove_reference :detail_paiement_classrooms, :year, foreign_key: true
    add_reference :detail_paiements, :year, foreign_key: true
    add_column :detail_paiements, :description, :text
  end
end
