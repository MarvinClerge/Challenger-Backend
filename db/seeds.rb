# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

Like.destroy_all
UserChallenge.destroy_all

User.destroy_all
Challenge.destroy_all

User.create(
  name: "MegaMoonManMarvin94",
  email_address: "marvin",
  password: "moon"
)
p "Marvin account created\n"

10.times do
  User.create(
    name: Faker::Name.name,
    email_address: Faker::LeagueOfLegends.champion,
    password: "moon"
  )
  p "User Created\n"
end

categories = ["easy", "intermediate", "hard"]

10.times do
  Challenge.create(
    name: Faker::Company.name,
    description: Faker::GameOfThrones.quote,
    category: categories[rand(0..2)],
    content: 'co',
    test: 'te'
  )
  p "Challenge Created"
end

20.times do
  UserChallenge.create(
    user_id: rand(User.all.count),
    challenge_id: rand(Challenge.all.count)
  )
  p "UserChallenge Created\n"
end

20.times do
  Like.create(
    user_id: rand(User.all.count),
    challenge_id: rand(Challenge.all.count)
  )
  p "Like Created\n"
end
