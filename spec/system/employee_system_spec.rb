require 'rails_helper'

RSpec.describe 'Employee', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'signs employee up' do
    employee = build(:employee)
    visit '/employees/sign_up'
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password
    fill_in 'Password confirmation', with: employee.password
    click_button 'commit'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
