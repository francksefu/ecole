class Teacher < ApplicationRecord
  has_many :course_classroom_teachers

  validates :name, presence: true
  validates :first_name, presence: true
  validates :phone, presence: true
end
