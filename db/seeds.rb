# TODO: remove later
Estimation::Report::Repo.new.purge_table
Estimation::Task::Repo.new.purge_table
Staff::User::Repo.new.purge_table
Estimation::Project::Model.all.map(&:destroy)
Staff::Organization::Model.all.map(&:destroy)
Estimation::Mark::Model.all.map(&:destroy)

# user    = Staff::User.create(email: 'main@user.com', password: 'password', password_confirmation: 'password')
# org     = user.add_organization(name: 'COAX')
# project = org.add_project(name: 'Test project', description: 'Test Description')
# report  = project.add_report(status: :new, technology: :ruby, user_id: user.id)
# task    = report.add_task(title: 'Test task', technology: :ruby, user_id: user.id)
# task.add_mark(user_id: user.id, optimistic: 4.5, pessimistic: 6)

require './spec/support/factory_bot.rb'

user = FactoryBot.create(:staff_user)
project = FactoryBot.create(:estimation_project)
report = FactoryBot.create(:estimation_report, id: (Estimation::Report::Model.max(:id).to_i + 1), project_id: project.id, user_id: user.id, created_at: Time.current) # some shit happens here
# report = FactoryBot.build(:estimation_report, project_id: project.id, user_id: user.id, created_at: Time.current)
# report.save

10.times do
  report.add_task(FactoryBot.create(:estimation_task))
end

20.times do
  report.tasks.last.add_mark(FactoryBot.create(:estimation_mark, report_id: report.id))
  report.tasks.first.add_mark(FactoryBot.create(:estimation_mark, report_id: report.id))
end
