FactoryBot.define do
  factory :admin do
    sequence(:email) { |i| "admin#{i}@sample.com" }
    password { 'password1' }
  end
end
