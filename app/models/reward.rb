class Reward < ApplicationRecord
  has_many :orders, dependent: nil
  validates :price, numericality: { greater_than: 0 }
  validates :title, presence: true
  validates :description, presence: true
end
