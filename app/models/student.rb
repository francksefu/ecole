require_relative 'associate_user'

class Student < ApplicationRecord
  include AssociateUser

  has_many :promotions
  has_many :classrooms, through: :promotions
  belongs_to :parent
  has_many :paiements
  belongs_to :user

  validates :name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at date_of_birth first_name id id_value last_name name parent_id phone
       updated_at user_id]
  end
end
