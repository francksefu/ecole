class RemoveDateToPaiements < ActiveRecord::Migration[7.1]
  def change
    remove_column :paiements, :date, :date
    remove_column :paiements, :reste, :float
    remove_reference :paiements, :promotion, foreign_key: true
    add_reference :paiements, :detail_paiement_classroom, foreign_key: true
    add_reference :paiements, :student, foreign_key: true
  end
end
