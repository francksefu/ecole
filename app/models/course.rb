class Course < ApplicationRecord
  has_many :course_classroom_teachers
  has_many :classrooms, through: :course_classroom_teachers
  has_many :evaluates
  has_many :promotions, through: :evaluates

  validates :name, presence: true
  validates :credit, presence: true
end
