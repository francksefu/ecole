require_relative 'associate_user'

class Parent < ApplicationRecord
  include AssociateUser

  has_many :students
  belongs_to :user

  validates :name, presence: true
  validates :first_name, presence: true
  validates :phone, presence: true
end
