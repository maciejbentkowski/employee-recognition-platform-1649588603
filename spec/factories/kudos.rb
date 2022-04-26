FactoryBot.define do
  factory :kudo do
    sequence(:title) { |i| "Sample kudo title nr #{i}" }
    sequence(:content) { |i| "Sample kudo content nr #{i}" }
    giver_id { 1 }
    receiver_id { 2 }
  end
end
