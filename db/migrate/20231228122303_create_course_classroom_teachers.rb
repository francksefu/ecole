class CreateCourseClassroomTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :course_classroom_teachers do |t|
      t.integer :course_id
      t.integer :classroom_id
      t.integer :teacher_id
      t.integer :year_id

      t.timestamps
    end
  end
end
