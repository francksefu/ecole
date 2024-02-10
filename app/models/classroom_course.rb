class ClassroomCourse < ApplicationRecord
  belongs_to :course
  belongs_to :classroom
end
