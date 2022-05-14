require 'rails_helper'

RSpec.describe 'Company Value', :type => :system do
  before do
    driven_by(:rack_test)
  end

  let!(:company_value1) { create(:company_value) }
  let!(:company_value2) { create(:company_value) }
  let!(:company_value3) { create(:company_value) }
  let(:admin) { create(:admin) }

  it 'listing company values' do
    admin_sign_in_and_expect_succesfully

    visit '/admins/company_values'
    expect(page).to have_content company_value1.title
    expect(page).to have_content company_value2.title
    expect(page).to have_content company_value3.title
  end

  it 'creates company value' do
    admin_sign_in_and_expect_succesfully

    visit '/admins/company_values/new'
    fill_in 'Title', with: 'sample title'
    click_button 'commit'
    expect(page).to have_content 'Company value was successfully created'
  end

  it 'edit company value' do
    admin_sign_in_and_expect_succesfully

    visit "/admins/company_values/#{company_value1.id}/edit"
    fill_in 'Title', with: 'Changed title'
    click_button 'commit'
    expect(page).to have_content 'Company value was successfully updated'
  end
  it 'destroy company value' do
    admin_sign_in_and_expect_succesfully

    visit '/admins/company_values'
    expect { (click_on 'Destroy', match: :first) }.to change(CompanyValue, :count).by(-1)
  end



  def admin_sign_in_and_expect_succesfully
    visit '/admins'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'commit'
    expect(page).to have_content 'Signed in successfully.'
  end
end
