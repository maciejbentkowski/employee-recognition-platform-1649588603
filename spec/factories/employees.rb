FactoryBot.define do
    factory :employee do
        sequence(:email) { |i| "employee#{i}@sample.com" }
        password {"password"}
    end
    end