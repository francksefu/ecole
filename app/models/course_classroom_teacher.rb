class CourseClassroomTeacher < ApplicationRecord
  belongs_to :course
  belongs_to :classroom
  belongs_to :teacher
  belongs_to :year

  validates :course_id, presence: true
  validates :classroom_id, presence: true
  validates :teacher_id, presence: true
end
