class ProfileController < ApplicationController
    def show
        @employee = Employee.find(params[:id])
        @kudos = Kudo.where(giver_id: @employee)
        end
end
