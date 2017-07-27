# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Cat.destroy_all
cats = []
10.times do
  cats << Cat.create!(birth_date: Faker::Date.birthday(1, 10),
  color: Cat.colors.sample, name: Faker::Cat.name, sex: %w( M F ).sample, description: Faker::Cat.breed)
end


CatRentalRequest.destroy_all
5.times do
  CatRentalRequest.create!(status: "PENDING", cat_id: cats.sample.id,
  start_date: Faker::Date.backward(14) , end_date: Faker::Date.forward(21))
end

User.create!(user_name: "Michael", password: "password")
User.create!(user_name: "Hein", password: "password2")
