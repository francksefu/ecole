class CourseTeacher < ApplicationRecord
  belongs_to :classroom_course
  belongs_to :teacher
  belongs_to :year
end
