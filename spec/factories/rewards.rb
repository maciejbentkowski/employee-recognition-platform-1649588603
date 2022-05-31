FactoryBot.define do
  factory :reward do
    title { Faker::Lorem.word }
    description { Faker::Quotes::Shakespeare.hamlet_quote }
    price { rand(1..1000) }

    trait :no_title do
      title { '' }
    end

    trait :no_description do
      description { '' }
    end

    trait :no_price do
      price { 0 }
    end

    factory :invalid_reward, traits: %i[no_title no_description no_price]
  end
end
