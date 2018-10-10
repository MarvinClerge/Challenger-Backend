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

5.times do
  User.create(name: Faker::Name.name, password: "moon")
end

10.times do
  Challenge.create(
    name: Faker::Company.name,
    description: "this desc",
    category: 'ca',
    content: 'co',
    test: 'te'
  )
end

20.times do
  UserChallenge.create(
    user_id: rand(User.all.count),
    challenge_id: rand(Challenge.all.count)
  )
end

20.times do
  Like.create(
    user_id: rand(User.all.count),
    challenge_id: rand(Challenge.all.count)
  )
end
