class MiningRig < ApplicationRecord
  belongs_to :user
  has_many :mining_rig_miners
  has_many :miners, through: :mining_rig_miners

  validates :name, uniqueness: true
  validates_presence_of :name, on: :create

  def miners_attributes=(miners_attributes)
    miners_attributes.each_value do |miner_attributes|
      miner =  Miner.new(miner_attributes)
      if miner.valid?
        miners << miner
      end
    end
  end

  def total_miners
    miners.count
  end
end
