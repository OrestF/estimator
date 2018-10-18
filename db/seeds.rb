# TODO: remove later
Estimation::Report.all.map(&:destroy)
Estimation::Task.all.map(&:destroy)
User.all.map(&:destroy)
Estimation::Project.all.map(&:destroy)
Organization.all.map(&:destroy)
Estimation::Mark.all.map(&:destroy)

user = User.create(email: 'main@user.com', password: 'password', password_confirmation: 'password')
org = user.add_organization(name: 'COAX')
project = org.add_project(name: 'Test project', description: 'Test Description')
report = project.add_report(status: :new, technology: :ruby, user_id: user.id)
task = report.add_task(title: 'Test task', technology: :ruby, user_id: user.id)
task.add_mark(user_id: user.id, optimistic: 4.5, pessimistic: 6)
