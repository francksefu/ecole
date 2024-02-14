class CreatePaiements < ActiveRecord::Migration[7.1]
  def change
    create_table :paiements do |t|
      t.datetime :date
      t.float :montant
      t.float :reste
      t.references :promotion, foreign_key: true
      t.references :accountant, foreign_key: true
      t.timestamps
    end
  end
end
