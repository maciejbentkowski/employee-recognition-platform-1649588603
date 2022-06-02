# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(*)
    if current_admin
      dashboard_path
    elsif current_employee
      root_path
    end
  end
end
