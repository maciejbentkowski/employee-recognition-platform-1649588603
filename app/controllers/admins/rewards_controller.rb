module Admins
  class RewardsController < ApplicationController
    before_action :require_admin_login

    def index
      @rewards = Reward.all
    end

    def new
      @reward = Reward.new
    end

    def create
      @reward = Reward.new(reward_params)

      if @reward.save
        redirect_to admins_rewards_path, notice: 'Reward was successfully created.'
      else
        render :new
      end
    end

    def edit
      reward_find
    end

    def update
      reward_find
      if @reward.update(reward_params)
        redirect_to admins_rewards_path, notice: 'Reward was succesfully updated.'
      else
        render :edit
      end
    end

    def destroy
      reward_find
      @reward.destroy
      redirect_to admins_rewards_path, notice: 'Reward successfully destroyed.'
    end

    private

    def reward_find
      @reward = Reward.find(params[:id])
    end

    def reward_params
      params.require(:reward).permit(:title, :description, :price)
    end
  end
end
