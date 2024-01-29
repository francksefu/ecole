class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :student
  has_one :parent
  has_one :teacher
  has_one :accountant
  has_one :discipline_director
  has_one :studies_director

  def is?(check_role)
    role == check_role.to_s
  end
end
