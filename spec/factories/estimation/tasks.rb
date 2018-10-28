FactoryBot.define do
  factory :estimation_task, class: Estimation::Task::Model do
    title { Faker::Job.title }
    technology { Estimation::Report::Model::TECHNOLOGIES.sample }
    user_id { create(:staff_user).id }
  end
end
