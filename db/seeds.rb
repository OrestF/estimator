# TODO: remove later
User.all.map(&:destroy)
Estimation::Project.all.map(&:destroy)
Organization.all.map(&:destroy)
Estimation::Report.all.map(&:destroy)

user = User.create(email: 'main@user.com', password: 'password', password_confirmation: 'password')
org = user.add_organization(name: 'COAX')
project = org.add_project(name: 'Test project', description: 'Test Description')
project.add_report(status: :new, technology: :ruby, user_id: user.id)
