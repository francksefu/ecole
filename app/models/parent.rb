class Parent < ApplicationRecord
  has_many :students
  belongs_to :user

  validates :name, presence: true
  validates :first_name, presence: true
  validates :phone, presence: true



  def create_associate_user
    email_u = name + id.to_s + '@cg.com'
    password_u = name + id.to_s
    u = User.new(email: email_u, password: password_u, role: 'parent')
    u.save
    update(user: u)
  end
end
