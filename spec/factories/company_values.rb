FactoryBot.define do
  factory :company_value do
    sequence(:title) { |i| "Company Value title #{i}" }
  end
end
