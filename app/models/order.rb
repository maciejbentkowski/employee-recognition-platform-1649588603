class Order < ApplicationRecord
  has_one :employee
  has_one :reward
end
