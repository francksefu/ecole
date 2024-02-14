class Promotion < ApplicationRecord
  belongs_to :classroom
  belongs_to :student
  belongs_to :year

  has_many :paiements

  has_many :evaluations
  has_many :courses, through: :evaluates

  validates :classroom_id, presence: true
  validates :student_id, presence: true
  validates :year_id, presence: true
end
