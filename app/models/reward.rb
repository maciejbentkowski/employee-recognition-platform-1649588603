class Reward < ApplicationRecord
  validates :price, numericality: { greater_than: 0 }

  def price_must_be_positive_number
    return unless price.positive?

    errors.add(:price_must_be_positive_number, 'Price must be greater than 0')
  end
end
