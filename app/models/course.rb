class Course < ApplicationRecord
  has_many :classroom_courses
  has_many :classroom, through: :classroom_courses
  has_many :evaluates
  has_many :promotions, through: :evaluates

  validates :name, presence: true
  validates :credit, presence: true
end
