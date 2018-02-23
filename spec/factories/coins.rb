FactoryBot.define do
  factory :coin do
    name { Faker::Beer.hop }
    symbol { Faker::Beer.hop }
    difficulty { Faker::Number.decimal(2, 2) }
    amount { Faker::Number.decimal(2, 2) }
    price { Faker::Number.decimal(2, 2) }
  end
end
