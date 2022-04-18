require "rails_helper"

RSpec.describe "Create Kudo", :type => :system do
    before do
        driven_by(:rack_test)
    end
  it "Creating kudo" do
    employee = create(:employee)
    employee2 = create(:employee)
    visit '/employees/sign_in'
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password
    click_button 'commit'
    kudo = build(:kudo)
    visit '/kudos/new'
    fill_in 'Title', with: kudo.title
    fill_in 'Content', with: kudo.content
    select employee2.email, from: 'Receiver'
    click_button 'commit'
    expect(page).to have_content 'Kudo was successfully created.'
  end
end