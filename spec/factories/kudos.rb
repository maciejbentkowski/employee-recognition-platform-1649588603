FactoryBot.define do
  factory :kudo do
    title { 'Sample kudo title' }
    content { 'Sample kudo content' }
    giver_id { 1 }
    receiver_id { 3 }
  end
end
