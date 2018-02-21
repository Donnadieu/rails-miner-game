FactoryBot.define do
  factory :coin do
    name { Faker::Name.name }
    symbol { Faker::Name.name }
    difficulty { Faker::Number.decimal(2, 2) }
    price { Faker::Number.decimal(2, 2) }
  end
end
