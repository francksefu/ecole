module AssociateUser
  def create_associate_user
    email_u = name.downcase + id.to_s + '@cg.com'
    password_u = name.downcase + id.to_s
    u = User.new(email: email_u, password: password_u, role: 'parent')
    u.save
    update(user: u)
  end
end
