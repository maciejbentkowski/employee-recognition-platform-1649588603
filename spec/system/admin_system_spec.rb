require 'rails_helper'

RSpec.describe 'Admin', :type => :system do

    before do
      driven_by(:rack_test)
    end

    let(:admin) { create(:admin) }
    let(:admin2) { create(:admin) }
    let(:admin3) { create(:admin) }
    let(:employee1) { create(:employee) }
    let(:employee2) { create(:employee) }
    let(:employee3) { create(:employee) }
    let!(:kudo1) { create(:kudo, giver_id: employee1.id, receiver_id: employee2.id) }
    let!(:kudo2) { create(:kudo, giver_id: employee2.id, receiver_id: employee3.id) }
    let!(:kudo3) { create(:kudo, giver_id: employee3.id, receiver_id: employee1.id) }

    it 'signs admin in' do
      admin_sign_in_and_expect_succesfully
    end

    it 'listing all kudos' do
      admin_sign_in_and_expect_succesfully
      visit '/admins/kudos'
      expect(page).to have_content kudo1.title
      expect(page).to have_content kudo1.content
      expect(page).to have_content kudo2.title
      expect(page).to have_content kudo2.content
      expect(page).to have_content kudo3.title
      expect(page).to have_content kudo3.content
    end

    it 'deleting Kudos' do
      admin_sign_in_and_expect_succesfully
      visit '/admins/kudos'
      expect(page).to have_content kudo1.title
      expect(page).to have_content kudo1.content
      expect(page).to have_content kudo2.title
      expect(page).to have_content kudo2.content
      expect(page).to have_content kudo3.title
      expect(page).to have_content kudo3.content
      expect { (click_on 'Destroy', match: :first) }.to change(Kudo, :count).by(-1)
    end

    def admin_sign_in_and_expect_succesfully
      visit '/admins'
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'commit'
      expect(page).to have_content "Signed in successfully."
    end

  end
