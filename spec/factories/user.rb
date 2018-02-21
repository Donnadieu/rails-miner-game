require 'faker'

FactoryBot.define do
  factory :user do
    username { Faker::Name }
    email { Faker::Internet.email }
    password 'password'
  end
end
