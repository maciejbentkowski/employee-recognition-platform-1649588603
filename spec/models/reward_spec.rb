require 'rails_helper'

RSpec.describe Reward, type: :model do
  let!(:reward) { build(:reward) }

  it 'is not valid without a title' do
    expect(reward).to be_valid
    reward.title = ''
    expect(reward).not_to be_valid
  end

  it 'is not valid without a description' do
    expect(reward).to be_valid
    reward.description = ''
    expect(reward).not_to be_valid
  end

  it 'is not valid without a price' do
    expect(reward).to be_valid
    reward.price = ''
    expect(reward).not_to be_valid
  end

  it 'price is greater than or equal to 1' do
    expect(reward).to be_valid
    reward.price = 0
    expect(reward).not_to be_valid
  end
end
