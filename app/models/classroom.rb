class Classroom < ApplicationRecord
  has_many :promotions
  has_many :students, through: :promotions
  has_many :detail_paiement_classrooms
  has_many :detail_paiements, through: :detail_paiement_classrooms
  has_many :course_classroom_teachers
  has_many :courses, through: :course_classroom_teachers
  has_many :schedules

  validates :section, presence: true
  validates :name, presence: true
end
