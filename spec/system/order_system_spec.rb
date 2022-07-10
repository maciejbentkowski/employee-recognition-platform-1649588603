require 'rails_helper'

RSpec.describe 'Order', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Ordering Rewards' do
    before do
      visit '/employees/sign_in'
      fill_in 'Email', with: employee.email
      fill_in 'Password', with: employee.password
      click_button 'commit'
    end

    let!(:employee) { create(:employee_with_20_points) }
    let!(:reward) { create(:reward) }
    let!(:reward_that_cost_thirty) { create(:reward_with_price_thirty) }

    it 'Remove points after buy a reward' do
      expect(employee.points).to eq(20.0)
      employee_old_points = employee.points
      visit '/orders/new'
      select employee.email, from: 'Employee'
      select reward.title, from: 'Reward'
      click_button 'commit'
      expect(page).to have_content 'You bought reward succesfully'
      employee.reload
      expect(employee.points).to eq(employee_old_points - reward.price)
    end

    it "Cannot buy rewards that can't afford" do
      visit '/orders/new'
      select employee.email, from: 'Employee'
      select reward_that_cost_thirty.title, from: 'Reward'
      click_button 'commit'
      expect(page).to have_content "You can't order this reward"
    end
  end
end
