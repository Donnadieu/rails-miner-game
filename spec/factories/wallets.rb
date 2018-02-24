FactoryBot.define do
  factory :wallet do
    limit { Faker::Number.number(4) }
    address{ Faker::Bitcoin.address }
  end
end
