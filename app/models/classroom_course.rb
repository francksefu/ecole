class ClassroomCourse < ApplicationRecord
  belongs_to :course
  belongs_to :classroom
  has_many :date_evaluations
end
