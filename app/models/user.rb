class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  validates :username, uniqueness: true
  validates :username, presence: true


  has_one :wallet
  has_one :coin, through: :wallet
  has_many :mining_rigs
  # has_many :miners, through: :mining_rigs

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.highest_balance
    order(balance: :desc)
  end

  def total_miners
    total = 0
    mining_rigs.each do |mining_rig|
      total += mining_rig.total_miners
    end
    total
  end

end
