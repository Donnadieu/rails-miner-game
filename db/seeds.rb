@user = User.create(
  username: 'omar',
  email: 'omar@email.com',
  password: '12345678'
)
Miner.create(
  consumption: Faker::Number.decimal(2, 2),
  price: Faker::Number.decimal(2, 2),
  hash_rate: Faker::Number.decimal(2, 2),
  user_id: @user.id
)
@wallet = Wallet.create(
  limit: Faker::Number.number(4),
  user_id: @user.id
)
3.times do
  Coin.create(
    name: Faker::Beer.hop,
    symbol: Faker::Beer.hop,
    difficulty: Faker::Number.decimal(2, 2),
    amount: Faker::Number.decimal(2, 2),
    price: Faker::Number.decimal(2, 2),
    wallet_id: @wallet.id
  )
end
