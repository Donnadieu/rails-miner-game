class MiningRig < ApplicationRecord
  belongs_to :user
  has_many :mining_rig_miners
  has_many :miners, through: :mining_rig_miners
end
