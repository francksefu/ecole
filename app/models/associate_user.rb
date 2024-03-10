module AssociateUser
  def create_associate_user(role)
    email_u = "#{name.downcase}#{id}@cg.com"
    password_u = name.downcase + id.to_s + role[0..1]
    u = User.new(email: email_u, password: password_u, role:)
    u.save
    update(user: u)
  end
end
