class CourseTeacher < ApplicationRecord
  belongs_to :classroom_courses
  belongs_to :teacher
  belongs_to :year
end
