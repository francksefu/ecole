class AddColumn < ActiveRecord::Migration[7.1]
  def change
    add_column :give_works, :render_time, :datetime
    remove_column :give_works, :link, :string
  end
end
