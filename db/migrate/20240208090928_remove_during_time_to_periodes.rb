class RemoveDuringTimeToPeriodes < ActiveRecord::Migration[7.1]
  def change
    remove_column :periodes, :during_time, :integer
  end
end
