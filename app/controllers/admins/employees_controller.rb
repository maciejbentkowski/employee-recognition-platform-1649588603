class Admins::EmployeesController < ApplicationController
    before_action :set_employee, only: [:show, :edit, :update, :destroy]
    before_action :require_admin_login
    def index
        @employees = Employee.all
    end
    def new
        @employee = Employee.new
    end
    def edit
    end

    def update
      check_if_password_param_is_blank
      if @employee.update(employee_params)
        redirect_to employees_path, notice: 'Employee was successfully updated'
      else
        render :edit
      end
    end

    def destro
        @kudos = Kudo.where(['giver_id = ? or receiver_id = ?', @employee.id, @employee.id]).all
        @kudos.each(&:destroy)
        @employee.destroy
        redirect_to admins_employees_url, notice: 'Employee was successfully destroyed.'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:email, :number_of_available_kudos,:password)
    end
    def check_if_password_param_is_blank
      if params[:employee][:password].blank?
        params[:employee].delete(:password)
      end
    end


end
