FactoryBot.define do
  factory :order do
    employee
    reward

    trait :cost_five do
      points { 5 }
    end
    factory :order_cost_five, traits: %i[cost_five]
  end
end
