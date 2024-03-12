require_relative 'associate_user'

class Teacher < ApplicationRecord
  include AssociateUser

  has_many :course_teachers
  has_many :classroom_courses, through: :course_teachers
  belongs_to :user

  validates :name, presence: true
  validates :first_name, presence: true
  validates :phone, presence: true
end
