class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
    @kudos = Kudo.where(giver_id: @employee)
    @orders = Order.where(employee_id: params[:id])
  end
end
