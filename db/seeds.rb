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
rand(1..20).times do |k|
Kudo.create!(title: "sample title number #{k}", content: "sample content number #{k}", giver_id: rand(1..5), receiver_id: rand(1..5))

employees.each do |e|
    rand(1..9).times do |k|
        random = rand(1..5)
        next if e == random
            Kudo.create!(title: "sample title number #{k}", content: "sample content number #{k}", giver_id: e.id, receiver_id: random)
end
end
