class ClassroomCourse < ApplicationRecord
  belongs_to :course
  belongs_to :classroom

  has_many :course_teachers
  has_many :teachers, through: :course_teachers
end
