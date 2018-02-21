require 'faker'

FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Name.name }
  end
end
