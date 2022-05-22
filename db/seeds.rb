# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.create!(email:"admin1@sample.com", password: "password1")
puts "Admin created! #{admin.email} #{admin.password}"
5.times do |e|
    employee = Employee.create!(email:"employee#{e+1}@sample.com", password:"password#{e+1}")
    puts employee.email
end

company_value1 = CompanyValue.create!(title:"Honesty")
company_value2 = CompanyValue.create!(title:"Ownership")
company_value3 = CompanyValue.create!(title:"Accountability")
company_value4 = CompanyValue.create!(title:"Passion")

Kudo.create!(title: "sample title number 1", content: "sample content number 1", giver_id: 1, receiver_id: 5, company_value: company_value1)
Kudo.create!(title: "sample title number 2", content: "sample content number 2", giver_id: 1, receiver_id: 5, company_value: company_value2)
Kudo.create!(title: "sample title number 3", content: "sample content number 3", giver_id: 2, receiver_id: 4, company_value: company_value3)
Kudo.create!(title: "sample title number 4", content: "sample content number 4", giver_id: 2, receiver_id: 4, company_value: company_value4)
Kudo.create!(title: "sample title number 5", content: "sample content number 5", giver_id: 3, receiver_id: 4, company_value: company_value1)
Kudo.create!(title: "sample title number 6", content: "sample content number 6", giver_id: 3, receiver_id: 4, company_value: company_value2)
Kudo.create!(title: "sample title number 7", content: "sample content number 7", giver_id: 4, receiver_id: 3, company_value: company_value3)
Kudo.create!(title: "sample title number 8", content: "sample content number 8", giver_id: 4, receiver_id: 3, company_value: company_value4)
Kudo.create!(title: "sample title number 9", content: "sample content number 9", giver_id: 5, receiver_id: 1, company_value: company_value1)
Kudo.create!(title: "sample title number 10", content: "sample content number 10", giver_id: 5, receiver_id: 1, company_value: company_value2)


