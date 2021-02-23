# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "faker"



5.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password"
    )

  rand(1..5).times do
    island = Island.create(
      name: Faker::Ancient.titan,
      location: Faker::Nation.nationality,
      price_per_night: 100,
      description: Faker::Lorem.sentences(number: 4),
      max_guests: 4,
      user_id: user.id,
      image_url: "https://www.meditainment.com/images/dmImage/SourceImage/island-paradise.jpg"
      )
  end
end


