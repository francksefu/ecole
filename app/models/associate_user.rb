module AssociateUser
  def create_associate_user(role)
    email_u = name.downcase + id.to_s + '@cg.com'
    password_u = name.downcase + id.to_s
    u = User.new(email: email_u, password: password_u, role:)
    u.save
    update(user: u)
  end
end
