FactoryBot.define do
  factory :reward do
    title { Faker::Lorem.word }
    description { Faker::Quotes::Shakespeare.hamlet_quote }
    price { rand(1000) }
  end
end
