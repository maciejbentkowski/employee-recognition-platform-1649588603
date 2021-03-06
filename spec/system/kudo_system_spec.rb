require 'rails_helper'

RSpec.describe 'Kudos', type: :system do
  before do
    driven_by(:rack_test)

    visit '/employees/sign_in'
    fill_in 'Email', with: employee1.email
    fill_in 'Password', with: employee1.password
    click_button 'commit'
  end

  let(:employee1) { create(:employee) }
  let(:employee2) { create(:employee) }
  let(:employee3) { create(:employee) }
  let!(:kudo1) { create(:kudo, giver_id: employee1.id, receiver_id: employee2.id) }
  let!(:company_value2) { create(:company_value, title: 'second company value') }

  it 'Creating kudo' do
    kudo = build(:kudo)
    visit '/kudos/new'
    fill_in 'Title', with: kudo.title
    fill_in 'Content', with: kudo.content
    select employee2.email, from: 'Receiver'
    click_button 'commit'
    expect(page).to have_content 'Kudo was successfully created.'
  end

  it 'Editing kudo' do
    visit "/kudos/#{kudo1.id}/edit"
    fill_in 'Title', with: 'Changed title'
    fill_in 'Content', with: 'Changed content'
    select employee2.email, from: 'Receiver'
    select company_value2.title, from: 'Company value'
    click_button 'commit'
    expect(page).to have_content 'Kudo was successfully updated.'
    expect(page).to have_content 'Changed title'
    expect(page).to have_content 'Changed content'
    expect(page).to have_content company_value2.title
  end

  it 'Deleting kudo' do
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
    kudo = build(:kudo)
    visit '/kudos/new'
    fill_in 'Title', with: kudo.title
    fill_in 'Content', with: kudo.content
    select employee3.email, from: 'Receiver'
    click_button 'commit'
    expect(page).to have_content "You can't add more Kudos"
  end
end
