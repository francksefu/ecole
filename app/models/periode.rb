class Periode < ApplicationRecord
  has_many :evaluates

  validates :name, presence: true
end
