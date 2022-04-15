require "rails_helper"

RSpec.describe "Create Employee", :type => :system do
    before do
        driven_by(:rack_test)
      end
        it "signs me up" do
          visit '/employees/sign_up'
            fill_in 'Email', with: 'user@example.com'
            fill_in 'Password', with: 'password'
            fill_in 'Password confirmation', with: 'password'
          click_button 'commit'
          expect(page).to have_content 'Welcome!'
        end
end