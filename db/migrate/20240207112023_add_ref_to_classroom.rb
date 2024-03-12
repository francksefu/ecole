class AddRefToClassroom < ActiveRecord::Migration[7.1]
  def change
    remove_column :classrooms, :section, :string
    add_reference :classrooms, :section, foreign_key: true
  end
end
