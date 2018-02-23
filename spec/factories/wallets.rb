FactoryBot.define do
  factory :wallet do
    limit { Faker::Number.number(4) }
  end
end
