class AddDescriptionToYears < ActiveRecord::Migration[7.1]
  def change
    add_column :years, :description, :text
  end
end
