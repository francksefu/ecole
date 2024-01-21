class DetailPaiement < ApplicationRecord
  has_many :detail_paiement_classrooms
  has_many :classrooms, through: :detail_paiement_classrooms

  validates :frais_name, presence: true
  validates :montant, presence: true
end
