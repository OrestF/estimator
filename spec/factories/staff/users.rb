FactoryBot.define do
  factory :staff_user, class: Staff::User do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
