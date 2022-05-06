
class Admins::PagesController < ApplicationController
    before_action :require_admin_login
    def dashboard
    end
    def employees
        @employees = Employee.all
    end

    def edit
      @employee = Employee.find(params[:id])
    end

    def destroy
        @employee = Employee.find(params[:id])
        if @employee.destroy
          redirect_to dashboard_path, notice: "User deleted."
        else
          redirect_to dashboard_path, flash: { error: "User could not be deleted." }
        end
    end
end
