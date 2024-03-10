# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create(email: 'admin@cg.com', password: '123456')
Administrator.create(name: 'franck_admin', first_name: 'sefu-admin', last_name: 'kal', phone: '+243973359746', date_of_birth: '1998-12-13', user: User.first)
