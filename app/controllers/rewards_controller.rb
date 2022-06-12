class RewardsController < ApplicationController
  def index
    @rewards = Reward.all
    @orders = Order.where(employee_id: current_employee)
  end

  def show
    @reward = Reward.find(params[:id])
  end
end
