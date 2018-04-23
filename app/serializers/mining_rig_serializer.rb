class MiningRigSerializer < ActiveModel::Serializer
  attributes :id, :name, :status
  has_many :miners

end
