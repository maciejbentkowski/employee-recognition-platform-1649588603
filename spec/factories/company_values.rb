FactoryBot.define do
  factory :company_value do
    sequence(:title) { |i| "sample title #{i}" }
  end
end
