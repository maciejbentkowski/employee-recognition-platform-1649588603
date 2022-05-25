module Admins
  class RewardsController < ApplicationController
    before_action :require_admin_login

    def index; end

    def edit; end

    def update; end

    def destroy; end

    private

    def reward_find
      @reward = Reward.find(params[:id])
    end

    def reward_params
      params.require(:reward).permit(:title, :content, :price)
    end
  end
end
