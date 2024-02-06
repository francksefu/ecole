class DropClassroomCourseTeacherTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :course_classroom_teachers
    add_reference :courses, :classroom, foreign_key: true
  end
end
