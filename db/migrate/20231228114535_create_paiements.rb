class CreatePaiements < ActiveRecord::Migration[7.1]
  def change
    create_table :paiements do |t|
      t.integer :promotion_id
      t.datetime :date
      t.float :montant
      t.float :reste

      t.timestamps
    end
  end
end
