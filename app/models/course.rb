class Course < ApplicationRecord
  belongs_to :classroom
  has_many :evaluates
  has_many :promotions, through: :evaluates
  has_many :course_teachers
  has_many :teachers, through: :course_teachers
  
  validates :name, presence: true
  validates :credit, presence: true
end
