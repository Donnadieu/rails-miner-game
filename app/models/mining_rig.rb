class MiningRig < ApplicationRecord
  belongs_to :user
  has_many :mining_rig_miners
  has_many :miners, through: :mining_rig_miners

  validates :name, uniqueness: true
  validates_presence_of :name, on: :create
  validate :miners_count_limit, on: :update

  def miners_attributes=(miners_attributes)
    miners_attributes.each_value do |miner_attributes|
      miner = Miner.new(miner_attributes)
      miners << miner if miner.valid?
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
