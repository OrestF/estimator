FactoryBot.define do
  factory :staff_organization, class: Staff::Organization do
    name { Faker::Company.name }
  end
end
