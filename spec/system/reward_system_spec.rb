require 'rails_helper'

RSpec.describe 'Reward', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:reward) { build(:reward) }
  let!(:reward1) { create(:reward) }
  let!(:reward2) { create(:reward) }
  let!(:reward3) { create(:reward) }
  let(:admin) { create(:admin) }

  it 'lists rewards' do
    admin_sign_in_and_expect_succesfully

    visit '/admins/rewards'
    expect(page).to have_content reward1.title
    expect(page).to have_content reward2.title
    expect(page).to have_content reward3.title
  end

  it 'creates reward' do
    admin_sign_in_and_expect_succesfully

    visit '/admins/rewards/new'
    fill_in 'Title', with: reward.title
    fill_in 'Description', with: reward.description
    fill_in 'Price', with: reward.price
    expect { click_on 'commit' }.to change(Reward, :count).by(1)
    expect(page).to have_content 'Reward was successfully created.'
  end

  it 'edit company value' do
    admin_sign_in_and_expect_succesfully

    visit "/admins/rewards/#{reward1.id}/edit"
    fill_in 'Title', with: 'Changed title'
    fill_in 'Description', with: 'Changed description'
    fill_in 'Price', with: '123'
    click_button 'commit'
    expect(page).to have_content 'Reward was succesfully updated.'
    expect(page).to have_content 'Changed title'
  end

  it 'destroy company value' do
    admin_sign_in_and_expect_succesfully

    visit '/admins/rewards'
    expect { (click_on 'Destroy', match: :first) }.to change(Reward, :count).by(-1)
  end

  def admin_sign_in_and_expect_succesfully
    visit '/admins'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'commit'
    expect(page).to have_content 'Signed in successfully'
  end
end
