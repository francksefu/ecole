class Information < ApplicationRecord
  validates :source, presence: true
  validates :destination, presence: true
  validates :contenu, presence: true
  validates :date, presence: true
end
