FactoryBot.define do
  factory :estimation_task, class: Estimation::Task do
    title { Faker::Job.title }
    technology { Estimation::Report::TECHNOLOGIES.sample }
    user_id { create(:staff_user).id }
  end
end
