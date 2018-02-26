class MiningRig < ApplicationRecord
  belongs_to :user
  has_many :mining_rig_miners
  has_many :miners, through: :mining_rig_miners

  validates :name, uniqueness: true
  validates_presence_of :name, on: :create
  validates_presence_of :miners, on: :create, message: 'is invalid'
  validate :miners_count_limit, on: :update
  validates_presence_of :miners

  def miners_attributes=(miners_attributes)
    miners_attributes.each_value do |miner_attributes|
      miners.build(miner_attributes)
    end
  end

  def total_miners
    miners.count
  end

  private

  def miners_count_limit
    return if miners.blank?
    errors.add(:miners, 'Limit reached') if miners.size > 5
  end
end
