class ProfilesController < ApplicationController
  before_action :require_login
  def show
    @employee = Employee.find(params[:id])
    @kudos = Kudo.where(giver_id: @employee)
  end
end
