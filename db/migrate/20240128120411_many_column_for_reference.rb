class ManyColumnForReference < ActiveRecord::Migration[7.1]
  def change
    add_reference :students, :user, foreign_key: true
    add_reference :teachers, :user, foreign_key: true
    add_reference :parents, :user, foreign_key: true 
    add_reference :accountants, :user, foreign_key: true
    add_reference :discipline_directors, :user, foreign_key: true
  end
end
