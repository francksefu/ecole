class Paiement < ApplicationRecord
  belongs_to :student
  belongs_to :accountant
  belongs_to :detail_paiement_classroom

  validates :student_id, presence: true
  validates :accountant_id, presence: true
  validates :montant, numericaly: true
  validates :date, presence: true
end
