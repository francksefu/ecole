class CourseTeacher < ApplicationRecord
  belongs_to :course
  belongs_to :teacher
  belongs_to :year
end
