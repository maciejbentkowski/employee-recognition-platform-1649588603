class Reward < ApplicationRecord
  belongs_to :orders
  validates :price, numericality: { greater_than: 0 }
  validates :title, presence: true
  validates :description, presence: true
end
