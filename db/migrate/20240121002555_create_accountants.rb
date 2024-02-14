class CreateAccountants < ActiveRecord::Migration[7.1]
  def change
    create_table :accountants do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :phone

      t.timestamps
    end
  end
end
