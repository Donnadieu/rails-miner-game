@user = User.create(
  username: 'omar',
  email: 'omar@email.com',
  password: '12345678'
)

@mining_rig = MiningRig.create(
  name: Faker::Beer.hop,
  user_id: @user.id
)
3.times do
  Miner.create(
    consumption: Faker::Number.decimal(2, 2),
    price: Faker::Number.decimal(2, 2),
    hash_rate: Faker::Number.decimal(2, 2),
    mining_rig_id: @mining_rig.id
  )
end


@wallet = Wallet.create(
  limit: Faker::Number.number(4),
  user_id: @user.id
)

Coin.create(
  name: Faker::Beer.hop,
  symbol: Faker::Beer.hop,
  difficulty: Faker::Number.decimal(2, 2),
  amount: Faker::Number.decimal(2, 2),
  price: Faker::Number.decimal(2, 2),
  wallet_id: @wallet.id
)
