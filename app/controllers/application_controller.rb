# frozen_string_literal: true

class ApplicationController < ActionController::Base


    private

    def require_login
        if !(employee_signed_in?)
            redirect_to home_path
        end
    end
    def require_admin_login
        if !(admin_signed_in?)
            redirect_to home_path
        end
    end
    def after_sign_in_path_for(resource)
        stored_location_for(resource) || dashboard_path
    end


end
