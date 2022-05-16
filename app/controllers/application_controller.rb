# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def require_login
    redirect_to home_path unless employee_signed_in?
  end

  def require_admin_login
    redirect_to home_path unless admin_signed_in?
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end
end
