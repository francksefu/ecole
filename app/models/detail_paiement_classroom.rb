class DetailPaiementClassroom < ApplicationRecord
  belongs_to :detail_paiement
  belongs_to :classroom
  has_many :paiements

  validates :detail_paiement_id, presence: true
  validates :classroom_id, presence: true
end
