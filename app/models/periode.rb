class Periode < ApplicationRecord
  has_many :evaluates
  belongs_to :year
  validates :name, presence: true
end
