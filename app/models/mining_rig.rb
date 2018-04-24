class MiningRig < ApplicationRecord
  belongs_to :user
  has_many :mining_rig_miners
  has_many :miners, through: :mining_rig_miners

  validates_presence_of :name, on: :create
  validates_presence_of :mining_rig_miners, on: :create, message: 'are invalid'
  validate :miners_count_limit, on: :update
  validates_presence_of :mining_rig_miners

  def mining_rig_miners_attributes=(mining_rig_miners_attributes)
    mining_rig_miners_attributes.each_value do |mining_rig_miners_attribute|
      if !mining_rig_miners_attribute[:hash_rate].empty?
        miner = Miner.create(hash_rate: mining_rig_miners_attribute[:hash_rate])
        mining_rig_miner = self.mining_rig_miners.find_or_initialize_by(miner: miner)
        mining_rig_miner.update(mining_rig_miners_attribute)
      end
    end
  end

  def total_miners
    miners.count
  end

  def change_status
    miners.each do |miner|
      if miner.status
        miner.status = false
      else
        miner.status = true
      end
      miner.save
    end
  end

  def total_cosumption
    total = 0
    miners.each{ |miner| total += miner.consumption }
    total
  end

  def total_hashrate
    total = 0
    miners.each{ |miner| total += miner.hash_rate }
    total
  end

  private

  def miners_count_limit
    return if miners.blank?
    errors.add(:miners, 'Limit reached') if miners.size > 5
  end
  handle_asynchronously :change_status, :run_at => Proc.new { 1.minutes.from_now }
end
