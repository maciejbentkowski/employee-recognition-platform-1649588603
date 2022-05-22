module Admins
  class CompanyValuesController < ApplicationController
    before_action :require_admin_login
    def index
      @company_values = CompanyValue.all
    end

    def show; end

    def new
      @company_value = CompanyValue.new
    end

    def create
      @company_value = CompanyValue.new(company_values_params)
      if @company_value.save
        redirect_to admins_company_values_path, notice: 'Company value was successfully created.'
      else
        render :new
      end
    end

    def edit
      company_value_find
    end

    def update
      company_value_find
      if @company_value.update(company_values_params)
        redirect_to admins_company_values_path, notice: 'Company value was successfully updated'
      else
        render :edit
      end
    end

    def destroy
      company_value_find
      @company_value.destroy
      redirect_to admins_company_values_path, notice: 'Company value was successfully destroyed.'
    end

    private

    def company_value_find
      @company_value = CompanyValue.find(params[:id])
    end

    def company_values_params
      params.require(:company_value).permit(:title)
    end
  end
end
