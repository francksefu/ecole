class CreateDetailPaiements < ActiveRecord::Migration[7.1]
  def change
    create_table :detail_paiements do |t|
      t.string :frais_name
      t.float :montant

      t.timestamps
    end
  end
end
