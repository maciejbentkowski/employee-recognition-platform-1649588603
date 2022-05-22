require 'rails_helper'

RSpec.describe 'Kudos', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:employee1) { create(:employee) }
  let(:employee2) { create(:employee) }
  let(:employee3) { create(:employee) }
  let!(:kudo1) { create(:kudo, giver_id: employee1.id, receiver_id: employee2.id) }

  it 'Creating kudo' do
    employee_sign_in_and_expect_succesfully
    kudo = build(:kudo)
    visit '/kudos/new'
    fill_in 'Title', with: kudo.title
    fill_in 'Content', with: kudo.content
    select employee2.email, from: 'Receiver'
    click_button 'commit'
    expect(page).to have_content 'Kudo was successfully created.'
  end

  it 'Editing kudo' do
    employee_sign_in_and_expect_succesfully
    visit "/kudos/#{kudo1.id}/edit"
    fill_in 'Title', with: 'Changed title'
    fill_in 'Content', with: 'Changed content'
    select employee2.email, from: 'Receiver'
    click_button 'commit'
    expect(page).to have_content 'Kudo was successfully updated.'
  end

  it 'Deleting kudo' do
    employee_sign_in_and_expect_succesfully
    visit "/kudos/#{kudo1.id}"
    expect { click_link 'Destroy' }.to change(Kudo, :count).by(-1)
    expect(page).to have_content('Kudo was successfully destroyed.')
  end

  it 'Cannot create more than 10 kudos' do
    create_list(
      :kudo,
      9,
      title: 'sample title',
      content: 'sample content',
      giver_id: employee1.id,
      receiver_id: employee3.id
    )
    employee_sign_in_and_expect_succesfully
    kudo = build(:kudo)
    visit '/kudos/new'
    fill_in 'Title', with: kudo.title
    fill_in 'Content', with: kudo.content
    select employee3.email, from: 'Receiver'
    click_button 'commit'
    expect(page).to have_content "You can't add more Kudos"
  end

  def employee_sign_in_and_expect_succesfully
    visit '/employees/sign_in'
    fill_in 'Email', with: employee1.email
    fill_in 'Password', with: employee1.password
    click_button 'commit'
    expect(page).to have_content 'Signed in successfully.'
  end
end
