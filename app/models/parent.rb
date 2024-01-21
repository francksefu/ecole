class Parent < ApplicationRecord
  has_many :students

  validates :name, presence: true
  validates :first_name, presence: true
  validates :phone, presence: true
end
