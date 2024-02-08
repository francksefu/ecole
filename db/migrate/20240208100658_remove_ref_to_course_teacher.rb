class RemoveRefToCourseTeacher < ActiveRecord::Migration[7.1]
  def change
    remove_reference :course_teachers, :course, foreign_key: true
    remove_reference :course_teachers, :classroom, foreign_key: true
    add_reference :course_teachers, :teacher, foreign_key: true
    add_reference :course_teachers, :classroom_course, foreign_key: true
  end
end
