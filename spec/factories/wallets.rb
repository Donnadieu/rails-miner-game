FactoryBot.define do
  factory :wallet do
    limit { Faker::Number.decimal(2, 3) }
  end
end
