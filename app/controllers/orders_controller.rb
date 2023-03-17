class OrdersController < ApplicationController
  def index
    @orders = Order.where(employee_id: current_employee)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.purchuase_price = reward.price
    if @order.save
      redirect_to rewards_path, notice: 'You bought reward succesfully'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:employee_id, :reward_id, :points)
  end

  def reward
    Reward.find_by(id: order_params[:reward_id])
  end

  def employee
    @employee = Employee.find_by(id: params[:employee_id])
  end

  def reward_find
    @reward = Reward.find_by(id: params[:reward_id])
  end
end
