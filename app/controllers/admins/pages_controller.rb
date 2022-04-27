
class Admins::PagesController < ApplicationController
    before_action :require_admin_login
    def dashboard
    end
end
