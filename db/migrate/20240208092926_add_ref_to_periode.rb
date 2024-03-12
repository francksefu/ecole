class AddRefToPeriode < ActiveRecord::Migration[7.1]
  def change
    add_reference :periodes, :year, foreign_key: true
    remove_reference :evaluations, :year, foreign_key: true
  end
end
