require 'rails_helper'

RSpec.describe CompanyValue, type: :model do
  let!(:company_value) { create(:company_value) }

  it 'is not valid without a title' do
    expect(company_value).to be_valid
    company_value.title = ''
    expect(company_value).not_to be_valid
  end

  it 'title must be unique' do
    expect(company_value).to be_valid
    second_company_value = described_class.new(title: company_value.title)
    expect(second_company_value).not_to be_valid
  end
end
