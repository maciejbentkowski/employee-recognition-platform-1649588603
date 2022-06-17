FactoryBot.define do
  factory :employee do
    sequence(:email) { |i| "employee#{i}@sample.com" }
    password { 'password' }

    trait :with_points do
      points { 20 }
    end
    factory :employee_with_20_points, traits: %i[with_points]
  end
end
