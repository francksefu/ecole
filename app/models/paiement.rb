class Paiement < ApplicationRecord
  belongs_to :promotion
  belongs_to :accountant

  validates :promotion_id, presence: true
  validates :accountant_id, presence: true
  validates :montant, numericaly: true
  validates :date, presence: true
end
