FactoryBot.define do
  factory :miner do
    consumption { Faker::Number.decimal(2, 2) }
    price { Faker::Number.decimal(2, 2) }
    hash_rate { Faker::Number.decimal(2, 2) }
  end
end
