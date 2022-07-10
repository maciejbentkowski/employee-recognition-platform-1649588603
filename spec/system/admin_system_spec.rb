require 'rails_helper'

RSpec.describe 'Admin', type: :system do
  before do
    driven_by(:rack_test)

    visit '/admins'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'commit'
  end

  let(:admin) { create(:admin) }

  it 'signs admin in' do
    expect(page).to have_content 'Signed in successfully'
  end

  describe 'Admin Kudos' do
    let(:employee1) { create(:employee) }
    let(:employee2) { create(:employee) }
    let!(:kudo1) { create(:kudo, giver_id: employee1.id, receiver_id: employee2.id) }
    let!(:kudo2) { create(:kudo, giver_id: employee2.id, receiver_id: employee1.id) }

    it 'lists all kudos' do
      visit '/admins/kudos'
      expect(page).to have_content kudo1.title
      expect(page).to have_content kudo1.content
      expect(page).to have_content kudo1.company_value.title
      expect(page).to have_content kudo2.title
      expect(page).to have_content kudo2.content
      expect(page).to have_content kudo2.company_value.title
    end

    it 'deleting Kudos' do
      visit '/admins/kudos'
      expect(page).to have_content kudo1.title
      expect(page).to have_content kudo1.content
      expect(page).to have_content kudo2.title
      expect(page).to have_content kudo2.content
      expect { (click_on 'Destroy', match: :first) }.to change(Kudo, :count).by(-1)
    end
  end

  describe 'Admin Employees' do
    let!(:employee1) { create(:employee) }
    let!(:employee2) { create(:employee) }

    it 'lists employees' do
      visit '/admins/employees'
      expect(page).to have_content employee1.email
      expect(page).to have_content employee2.email
    end

    it 'allow to update employee' do
      visit '/admins/employees'
      click_on 'Edit', match: :first
      expect(page).to have_content 'Editing Employee'
      fill_in 'Email', with: 'changedEmployee1@sample.com'
      fill_in 'Number of available kudos', with: '25'
      fill_in 'Password', with: 'sample123'
      click_button 'commit'
      expect(page).to have_content 'Employee was successfully updated'
    end

    it 'allow to destroy employee' do
      visit '/admins/employees'
      expect { (click_on 'Destroy', match: :first) }.to change(Employee, :count).by(-1)
    end
  end

  describe 'Admin Orders' do
    let!(:employee){ create(:employee_with_20_points)}
    let!(:order) { create(:order_cost_five, employee: employee) }

    it 'Changing the reward price does not affect to order' do
      expect(order.points).to eq(5.0)
      expect(order.employee_id).to be employee.id

      visit '/admins/rewards'
      visit "/admins/rewards/#{order.reward_id}/edit"
      fill_in 'Price', with: '10'
      click_button 'commit'
      expect(page).to have_content 'Reward was succesfully updated.'

      expect(order.points).to eq(5.0)
    end
  end
end
