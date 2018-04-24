class MinerSerializer < ActiveModel::Serializer
  attributes :id, :consumption, :hash_rate, :status
  has_many :mining_rig_miners
end
