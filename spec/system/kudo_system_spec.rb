require 'rails_helper'

RSpec.describe 'Kudos', :type => :system do
  before do
    driven_by(:rack_test)
  end

  it 'Creating kudo' do
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

  it 'Editing kudo' do
    employee = create(:employee)
    employee2 = create(:employee)
    employee3 = create(:employee)
    kudo = create(:kudo, giver_id: employee.id, receiver_id: employee2.id)
    visit '/employees/sign_in'
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password
    click_button 'commit'
    visit "/kudos/#{kudo.id}/edit"
    fill_in 'Title', with: 'Changed title'
    fill_in 'Content', with: 'Changed content'
    select employee3.email, from: 'Receiver'
    click_button 'commit'
    expect(page).to have_content 'Kudo was successfully updated.'
  end

  it 'Deleting kudo' do
    employee = create(:employee)
    employee2 = create(:employee)
    kudo = create(:kudo, giver_id: employee.id, receiver_id: employee2.id)
    visit '/employees/sign_in'
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password
    click_button 'commit'
    visit "/kudos/#{kudo.id}"

    expect { click_link 'Destroy' }.to change(Kudo, :count).by(-1)

    expect(page).to have_content("Kudo was successfully destroyed.")
  end

end
