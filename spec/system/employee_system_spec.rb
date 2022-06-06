require 'rails_helper'

RSpec.describe 'Employee', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Employee points' do
    before do
      visit '/employees/sign_in'
      fill_in 'Email', with: employee.email
      fill_in 'Password', with: employee.password
      click_button 'commit'
    end

    let!(:employee) { create(:employee) }
    let!(:receiver) { create(:employee) }
    let!(:kudo) { build(:kudo) }
    let!(:company_value) { create(:company_value) }

    it 'add point to receiver after give a kudo' do
      expect(receiver.points).to eq(0.0)
      visit '/kudos/new'
      fill_in 'Title', with: kudo.title
      fill_in 'Content', with: kudo.content
      select receiver.email, from: 'Receiver'
      select company_value.title, from: 'Company value'
      click_button 'commit'
      expect(page).to have_content 'Kudo was successfully created.'
      receiver.reload
      expect(receiver.points).to eq(1.0)
    end

    it 'remove point from receiver after Kudo destroy' do
      create(:kudo, giver: employee, receiver: receiver, company_value: company_value)
      receiver.reload
      expect(receiver.points).to eq(1.0)
      visit "/kudos/#{kudo.id}"
      expect { click_link 'Destroy' }.to change(Kudo, :count).by(-1)
      receiver.reload
      expect(receiver.points).to eq(0.0)
    end
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
