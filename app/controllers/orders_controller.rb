class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to rewards_path, notice: 'You bought reward succesfully'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:employee_id, :reward_id)
  end

  def employee
    @employee = Employee.find_by(id: params[:employee_id])
  end

  def reward
    @reward = Reward.find_by(id: params[:reward_id])
  end
end
