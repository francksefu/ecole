class CreateCourseTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :course_teachers do |t|
      
      t.timestamps
    end
  end
end
