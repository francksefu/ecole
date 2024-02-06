class CreateCourseTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :course_teachers do |t|
      t.references :course, foreign_key: true
      t.references :teacher, foreign_key: true
      t.references :year, foreign_key: true
      t.timestamps
    end
  end
end
