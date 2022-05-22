FactoryBot.define do
  factory :kudo do
    sequence(:title) { |i| "Kudo title nr #{i}" }
    sequence(:content) { |i| "Kudo content nr #{i}" }
    giver_id { 1 }
    receiver_id { 2 }
    company_value
  end
end
