class CreateClassroomCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :classroom_courses do |t|
      t.references :classroom, foreign_key: true
      t.references :course, foreign_key: true 
      t.timestamps
    end
  end
end
