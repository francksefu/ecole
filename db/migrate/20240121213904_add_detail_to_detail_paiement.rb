class AddDetailToDetailPaiement < ActiveRecord::Migration[7.1]
  def change
    add_column :detail_paiements, :end_date, :date
  end
end
