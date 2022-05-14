require 'rails_helper'

RSpec.describe CompanyValue, type: :model do
  it 'is not valid without a title' do
    company_value = CompanyValue.new(title: '')
    expect(company_value).not_to be_valid
    company_value.title = 'valid title'
    expect(company_value).to be_valid
  end

  it 'title must be unique' do
    first_company_value = CompanyValue.create!(title:'unique title')
    expect(first_company_value).to be_valid
    second_company_value = CompanyValue.new(title:'unique title')
    expect(second_company_value).not_to be_valid
  end
end
