# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if Rails.env.development?
  Category.create!(
    name: "Oculist"
  )
  Category.create!(
    name: "Therapist"
  )
  Category.create!(
    name: "Surgeon"
  )
  d = 0
  while d < 2
    Doctor.create!(
      phone: Faker::Number.number(digits: 10),
      name:Faker::Artist.name,
      email:Faker::Internet.email,
      category_id: 1,
      password: "123456",
      password_confirmation: "123456"
    )
    d += 1
  end
  d = 0
  while d < 2
    Doctor.create!(
      phone: Faker::Number.number(digits: 10),
      name:Faker::Artist.name,
      email:Faker::Internet.email,
      category_id: 2,
      password: "123456",
      password_confirmation: "123456"
    )
    d += 1
  end
  d = 0
  while d < 2
    Doctor.create!(
      phone: Faker::Number.number(digits: 10),
      name:Faker::Artist.name,
      email:Faker::Internet.email,
      category_id: 3,
      password: "123456",
      password_confirmation: "123456"
    )
    d += 1
  end
  puts "Doctors create"
end
AdminUser.create!(
  name: 'Admin',
  phone:'1020304050',
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password') if Rails.env.development?
puts "Admin create"