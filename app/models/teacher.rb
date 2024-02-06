class Teacher < ApplicationRecord
  has_many :course_teachers
  has_many :courses, through: :course_teachers
  belongs_to :user

  validates :name, presence: true
  validates :first_name, presence: true
  validates :phone, presence: true
end
