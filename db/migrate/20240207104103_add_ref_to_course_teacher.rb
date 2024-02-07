class AddRefToCourseTeacher < ActiveRecord::Migration[7.1]
  def change
    add_reference :course_teachers, :classroom, foreign_key: true
    add_reference :course_teachers, :course, foreign_key: true
    remove_column :courses, :classroom_id, :integer
  end
end
