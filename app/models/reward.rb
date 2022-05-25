class Reward < ApplicationRecord
  validates reward_must_be_positive_number

  def reward_must_be_positive_number
    return unless reward.positive?

    errors.add(:reward_must_be_positive_number, "Reward must be greater than 0")
  end
end
