class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :administrators
  has_many :students
  has_many :parents
  has_many :teachers
  has_many :accountants
  has_many :discipline_directors
  has_many :studies_directors

  def is?(check_role)
    role == check_role.to_s
  end
end
