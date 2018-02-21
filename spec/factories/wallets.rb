FactoryBot.define do
  factory :wallet do
    balance { Faker::Number.decimal(2, 3) }
    limit { Faker::Number.decimal(2, 3) }
  end
end
