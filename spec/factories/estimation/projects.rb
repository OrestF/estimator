FactoryBot.define do
  factory :estimation_project, class: Estimation::Project::Model do
    name { Faker::Company.name }
    description { Faker::Lorem.sentence }
    organization_id { create(:staff_organization).id }
  end
end
