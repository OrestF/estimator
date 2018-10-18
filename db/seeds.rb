user = User.create(email: 'main@user.com', password: 'password', password_confirmation: 'password')
user.add_organization(name: 'COAX')