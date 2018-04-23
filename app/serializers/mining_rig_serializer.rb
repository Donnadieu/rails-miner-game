class MiningRigSerializer < ActiveModel::Serializer
  attributes :id, :name, :status
  has_many :miners
  belongs_to :user
end
