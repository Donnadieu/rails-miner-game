FactoryBot.define do
  factory :coin do
    name { Faker::Name.name }
    symbol { Faker::Name.name }
    difficulty { Faker::Number.decimal(2, 2) }
    amount { Faker::Number.decimal(2, 2) }
  end
end
