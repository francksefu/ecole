class AddDateOfBirthToAccountants < ActiveRecord::Migration[7.1]
  def change
    add_column :accountants, :date_of_birth, :date
    add_column :discipline_directors, :date_of_birth, :date
    add_column :discipline_directors, :last_name, :string
  end
end
