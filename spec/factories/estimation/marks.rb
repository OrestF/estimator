FactoryBot.define do
  factory :estimation_mark, class: Estimation::Mark do
    optimistic { Faker::Number.decimal(1) }
    pessimistic { Faker::Number.decimal(1) }
    task_id { create(:estimation_task).id }
    user_id { create(:staff_user).id }
  end
end
