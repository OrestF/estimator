FactoryBot.define do
  factory :estimation_report, class: Estimation::Report::Model do
    technology { Estimation::Report::Model::TECHNOLOGIES.sample }
    status { Estimation::Report::Model::STATUSES.sample }

    project_id { create(:estimation_project).id }
    user_id { create(:staff_user).id }
  end
end
