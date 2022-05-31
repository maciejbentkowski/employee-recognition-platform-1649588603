require 'faker'

admin = Admin.create!(email:"admin1@sample.com", password: "password1")
puts "Admin created! #{admin.email} #{admin.password}"

%w[Honesty Ownership Accountability Passion].each do |company_value_title|
    company_value = CompanyValue.create!(title:company_value_title)
    puts company_value.title
end

10.times do |r|
  price = Random.new
  reward = Reward.create!(title: Faker::Lorem.word, description: Faker::Quotes::Shakespeare.hamlet_quote, price: price.rand(1..1000))
  puts reward.title, reward.description, reward.price
end
5.times do |e|
    employee = Employee.create!(email:"employee#{e+1}@sample.com", password:"password#{e+1}")
    puts employee.email
end
10.times do |e|
    giver = Employee.all.sample
    receiver = Employee.all.excluding(giver).sample
    kudo = Kudo.create!(title: "sample title number #{e}", content: "sample content number #{e}", giver: giver, receiver: receiver, company_value: CompanyValue.all.sample)
    puts kudo.title
end
