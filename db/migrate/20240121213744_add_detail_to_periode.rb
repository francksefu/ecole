class AddDetailToPeriode < ActiveRecord::Migration[7.1]
  def change
    add_column :periodes, :start_date, :date
    add_column :periodes, :end_date, :date
  end
end
