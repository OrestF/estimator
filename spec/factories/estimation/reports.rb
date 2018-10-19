FactoryBot.define do
  factory :estimation_report, class: Estimation::Report do
    technology { Estimation::Report::TECHNOLOGIES.sample }
    status { Estimation::Report::STATUSES.sample }

    project_id { create(:estimation_project).id }
    user_id { create(:staff_user).id }
  end
end
