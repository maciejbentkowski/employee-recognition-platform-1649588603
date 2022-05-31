require 'rails_helper'

RSpec.describe 'Admin Company Values CRUD', type: :system do
  before do
    driven_by(:rack_test)

    visit '/admins'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'commit'
  end

  let!(:company_value1) { create(:company_value) }
  let!(:company_value2) { create(:company_value) }
  let!(:company_value3) { create(:company_value) }
  let(:admin) { create(:admin) }

  it 'listing company values' do
    visit '/admins/company_values'
    expect(page).to have_content company_value1.title
    expect(page).to have_content company_value2.title
    expect(page).to have_content company_value3.title
  end

  it 'creates company value' do
    visit '/admins/company_values/new'
    fill_in 'Title', with: 'sample title'
    expect { click_on 'commit' }.to change(CompanyValue, :count).by(1)
    expect(page).to have_content 'Company value was successfully created'
  end

  it 'edit company value' do
    visit "/admins/company_values/#{company_value1.id}/edit"
    fill_in 'Title', with: 'Changed title'
    click_button 'commit'
    expect(page).to have_content 'Company value was successfully updated'
  end

  it 'destroy company value' do
    visit '/admins/company_values'
    expect { (click_on 'Destroy', match: :first) }.to change(CompanyValue, :count).by(-1)
  end
end
