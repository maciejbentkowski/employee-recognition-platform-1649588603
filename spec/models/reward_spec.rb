require 'rails_helper'

RSpec.describe Reward, type: :model do
  let!(:reward) { build(:reward) }
  let!(:invalid_reward) { build(:invalid_reward) }

  context 'when validates title' do
    it 'has a title' do
      expect(reward).to be_valid
    end

    it 'has not a title' do
      expect(invalid_reward).not_to be_valid
    end
  end

  context 'when validates description' do
    it 'has a description' do
      expect(reward).to be_valid
    end

    it 'has not a description' do
      expect(invalid_reward).not_to be_valid
    end
  end

  context 'when validates price' do
    it 'has a price' do
      expect(reward).to be_valid
    end

    it 'price is equal 0' do
      expect(invalid_reward).not_to be_valid
    end
  end
end
