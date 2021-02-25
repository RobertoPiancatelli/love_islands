# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "faker"
Island.destroy_all
User.destroy_all

aimee = User.create!(email: 'aimee@example.com', password: '123456')
lukas = User.create!(email: 'lukas@example.com', password: '123456')
rob = User.create!(email: 'rob@example.com', password: '123456')
jeremaia = User.create!(email: 'jeremaia@example.com', password: '123456')

arr = [aimee, lukas, rob, jeremaia]

puts "Running seed!"

arr.each do |user|

  rand(1..5).times do
    island = Island.create(
      name: Faker::Ancient.titan,
      location: Faker::Nation.nationality,
      price_cents: rand(300..500),
      description: Faker::Lorem.sentences(number: 4),
      max_guests: 4,
      user: user,
      image_url: "https://www.meditainment.com/images/dmImage/SourceImage/island-paradise.jpg"
      )
  end
end


puts "Complete, you have created users & islands!"
