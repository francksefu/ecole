class Accountant < ApplicationRecord
  has_many :paiements
  validates :name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
end
