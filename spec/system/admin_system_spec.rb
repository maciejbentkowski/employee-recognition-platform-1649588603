require 'rails_helper'

RSpec.describe 'Admin', :type => :system do
    before do
      driven_by(:rack_test)

    end

    it 'signs admin in' do
      admin = build(:admin)
      visit '/admins'
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'commit'
      expect(page).to have_content 'Signed in successfully.'
    end

    it 'listing all kudos' do
      employee1 = create(:employee)
      employee2 = create(:employee)
      employee3 = create(:employee)
      admin = build(:admin)
      kudo1 = create(:kudo, giver_id: employee1.id, receiver_id: employee2.id)
      kudo2 = create(:kudo, giver_id: employee2.id, receiver_id: employee3.id)
      kudo3 = create(:kudo, giver_id: employee3.id, receiver_id: employee1.id)
      visit '/admins'
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'commit'
      expect(page).to have_content "DASHBOARD"
      visit '/admins/kudos'
      expect(page).to have_content kudo1.title
      expect(page).to have_content kudo1.content
      expect(page).to have_content kudo2.title
      expect(page).to have_content kudo2.content
      expect(page).to have_content kudo3.title
      expect(page).to have_content kudo3.content
    end

    it 'deleting Kudos' do
      employee1 = create(:employee)
      employee2 = create(:employee)
      employee3 = create(:employee)
      admin = create(:admin)
      kudo1 = create(:kudo, giver_id: employee1.id, receiver_id: employee2.id)
      kudo2 = create(:kudo, giver_id: employee2.id, receiver_id: employee3.id)
      kudo3 = create(:kudo, giver_id: employee3.id, receiver_id: employee1.id)
      visit '/admins'
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'commit'
      expect(page).to have_content "DASHBOARD"
      visit '/admins/kudos'
      expect(page).to have_content kudo1.title
      expect(page).to have_content kudo1.content
      expect(page).to have_content kudo2.title
      expect(page).to have_content kudo2.content
      expect(page).to have_content kudo3.title
      expect(page).to have_content kudo3.content
      expect { (click_on "Destroy", match: :first) }.to change(Kudo, :count).by(-1)
    end

  end
