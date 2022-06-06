module Admins
  class KudosController < ApplicationController
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
end
