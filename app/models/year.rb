class Year < ApplicationRecord
  has_many :promotions
  has_many :detail_paiement_classrooms
  has_many :course_teachers
  has_many :evaluates

  validates :name, presence: true
end
