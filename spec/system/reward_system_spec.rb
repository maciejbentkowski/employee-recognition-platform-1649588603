require 'rails_helper'

RSpec.describe 'Rewards', type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:reward1) { create(:reward) }
  let!(:reward2) { create(:reward) }
  let!(:reward3) { create(:reward) }

  describe 'Employees rewards' do
    before do
      visit '/employees/sign_in'
      fill_in 'Email', with: employee.email
      fill_in 'Password', with: employee.password
      click_button 'commit'
    end

    let(:employee) { create(:employee) }

    it 'lists rewards' do
      visit '/rewards'
      expect(page).to have_content reward1.title
      expect(page).to have_content reward2.title
      expect(page).to have_content reward3.title
    end

    it 'show reward' do
      visit "/rewards/#{reward1.id}"
      expect(page).to have_content reward1.title
      expect(page).to have_content reward1.description
      expect(page).to have_content reward1.price
    end
  end

  describe 'Admins rewards' do
    before do
      visit '/admins'
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'commit'
    end

    let(:admin) { create(:admin) }
    let(:reward) { build(:reward) }

    it 'lists rewards' do
      visit '/admins/rewards'
      expect(page).to have_content reward1.title
      expect(page).to have_content reward2.title
      expect(page).to have_content reward3.title
    end

    it 'creates reward' do
      visit '/admins/rewards/new'
      fill_in 'Title', with: reward.title
      fill_in 'Description', with: reward.description
      fill_in 'Price', with: reward.price
      expect { click_on 'commit' }.to change(Reward, :count).by(1)
      expect(page).to have_content 'Reward was successfully created.'
    end

    it 'edit reward' do
      visit "/admins/rewards/#{reward1.id}/edit"
      fill_in 'Title', with: 'Changed title'
      fill_in 'Description', with: 'Changed description'
      fill_in 'Price', with: '123'
      click_button 'commit'
      expect(page).to have_content 'Reward was succesfully updated.'
      expect(page).to have_content 'Changed title'
    end

    it 'destroy reward' do
      visit '/admins/rewards'
      expect { (click_on 'Destroy', match: :first) }.to change(Reward, :count).by(-1)
    end
  end
end
