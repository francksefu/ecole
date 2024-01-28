class DisciplineDirector < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :first_name, presence: true
  validates :phone, presence: true
end
