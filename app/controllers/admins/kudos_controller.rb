class Admins::KudosController < ApplicationController
    before_action :require_admin_login


    def index
        @kudos = Kudo.all
    end
    def show
        @kudo = Kudo.find(params[:id])
    end
    def destroy
        @kudo = Kudo.find(params[:id])
        @kudo.destroy
        redirect_to admins_kudos_url
    end
end
