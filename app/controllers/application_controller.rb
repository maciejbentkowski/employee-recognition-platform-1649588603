# frozen_string_literal: true

class ApplicationController < ActionController::Base


    private

    def require_login
        if !(employee_signed_in?)
            redirect_to home_path
        end
    end


end
