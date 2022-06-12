class Reward < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :price, numericality: { greater_than: 0 }
  validates :title, presence: true
  validates :description, presence: true
end
