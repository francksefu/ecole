class Year < ApplicationRecord
  has_many :periodes
  has_many :promotions
  has_many :detail_paiements
  has_many :course_teachers
  has_many :evaluates

  validates :name, presence: true
end
