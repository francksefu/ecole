class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :administrators
  has_many :student
  has_many :parent
  has_many :teacher
  has_many :accountant
  has_many :discipline_director
  has_many :studies_director

  def is?(check_role)
    role == check_role.to_s
  end
end
