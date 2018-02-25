class MiningRig < ApplicationRecord
  belongs_to :user
  has_many :mining_rig_miners
  has_many :miners, through: :mining_rig_miners

  validates :name, uniqueness: true
  validates :name, presence: true

  def miners_attributes=(miners_attributes)
    miners_attributes.each_value do |miner_attributes|
      miners << Miner.find_or_create_by(miner_attributes)
    end
  end
end
