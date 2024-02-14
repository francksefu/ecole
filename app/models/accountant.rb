class Accountant < ApplicationRecord
  has_many :paiements
  belongs_to :user
  validates :name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
end
