user = User.create(email: 'main@user.com', password: 'password', password_confirmation: 'password')
org = user.add_organization(name: 'COAX')
org.add_project(name: 'Test project', description: 'Test Description')

