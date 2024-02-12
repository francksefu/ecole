class Periode < ApplicationRecord
  has_many :date_evaluations
  belongs_to :year
  validates :name, presence: true
end
