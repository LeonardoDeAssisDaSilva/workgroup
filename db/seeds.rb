# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Example User",
             email: "example@email.com",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@email.com"
  course = Faker::Educator.course
  university = Faker::Educator.university
  password = "password"
  User.create!(name:  name,
               email: email,
               course: course,
               organization: university,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
