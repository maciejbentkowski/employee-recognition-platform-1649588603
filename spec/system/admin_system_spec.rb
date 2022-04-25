RSpec.describe 'Admin', :type => :system do
    before do
      driven_by(:rack_test)
    end


    it 'signs admin in' do
      admin = create(:admin)
      visit '/admins'
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'commit'
      expect(page).to have_content 'Signed in successfully.'
    end
  end
