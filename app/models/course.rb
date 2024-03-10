class Course < ApplicationRecord
  has_many :classroom_courses
  has_many :classroom, through: :classroom_courses

  validates :name, presence: true
  validates :credit, presence: true
end
