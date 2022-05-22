module Admins
  class EmployeesController < ApplicationController
    before_action :require_admin_login
    def index
      @employees = Employee.all
    end

    def show
      employee_find
    end

    def new
      @employee = Employee.new
    end

    def edit
      employee_find
    end

    def update
      employee_find
      check_if_password_param_is_blank
      if @employee.update(employee_params)
        redirect_to employees_path, notice: 'Employee was successfully updated'
      else
        render :edit
      end
    end

    def destroy
      employee_find
      @employee.destroy
      redirect_to admins_employees_url, notice: 'Employee was successfully destroyed.'
    end

    private

    def employee_find
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:email, :number_of_available_kudos, :password)
    end

    def check_if_password_param_is_blank
      params[:employee].delete(:password) if params[:employee][:password].blank?
    end
  end
end
