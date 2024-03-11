class AddIsRemoteToDateEvaluations < ActiveRecord::Migration[7.1]
  def change
    add_column :date_evaluations, :is_remote, :boolean, :default => false
  end
end
