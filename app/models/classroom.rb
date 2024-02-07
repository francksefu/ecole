class Classroom < ApplicationRecord
  belongs_to :section
  has_many :promotions
  has_many :students, through: :promotions
  has_many :detail_paiement_classrooms
  has_many :detail_paiements, through: :detail_paiement_classrooms
  has_many :classroom_courses
  has_many :courses, through: :classroom_courses
  has_many :schedules

  validates :section, presence: true
  validates :name, presence: true
end
