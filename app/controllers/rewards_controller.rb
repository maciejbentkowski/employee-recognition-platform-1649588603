class RewardsController < ApplicationController
  before_action :require_login
  def index
    @rewards = Reward.all
  end

  def show
    @reward = Reward.find(params[:id])
  end
end
