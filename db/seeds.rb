# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.create!(email:"admin1@sample.com", password: "password1")
puts "Admin created! #{admin.email} #{admin.password}"

%w[Honesty Ownership Accountability Passion].each do |company_value_title|
    company_value = CompanyValue.create!(title:company_value_title)
    puts company_value.title
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

