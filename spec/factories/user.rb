FactoryBot.define do
  factory :user do
    username { Faker::Name }
    email { Faker::Internet::Name }
    password 'password'
  end
end
