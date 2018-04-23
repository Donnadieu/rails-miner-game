class UserSerializer < ActiveModel::Serializer
  attributes :id
  has_many :mining_rigs
end
