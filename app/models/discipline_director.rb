class DisciplineDirector < ApplicationRecord
  include AssociateUser

  has_many :observation_disciplinaries
  belongs_to :user
  validates :name, presence: true
  validates :first_name, presence: true
  validates :phone, presence: true
end
