FactoryBot.define do
  factory :estimation_mark, class: Estimation::Mark::Model do
    optimistic { Faker::Number.decimal(1) }
    pessimistic { Faker::Number.decimal(1) }
    task_id { create(:estimation_task).id }
    user_id { create(:staff_user).id }
    report_id { create(:estimation_report).id }
  end
end
