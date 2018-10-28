FactoryBot.define do
  factory :staff_organization, class: Staff::Organization::Model do
    name { Faker::Company.name }
  end
end
