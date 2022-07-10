class Order < ApplicationRecord
  belongs_to :employee
  belongs_to :reward

  after_save :remove_points_after_place_an_order

  validate :can_buy_reward?, on: :create

  def receiver
    Employee.find_by(id: params[:employee_id])
  end

  def remove_points_after_place_an_order
    points = employee.points - reward.price
    Employee.update(employee.id, points: points)
  end

  def can_buy_reward?
    return unless employee.points < reward.price

    errors.add(:order, "You can't order this reward")
  end
end
