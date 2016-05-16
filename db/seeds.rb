# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Beer.create(name: 'Pliny The Elder',                style: 'Imperial IPA',   manufacturer: 'Russian River')
# Beer.create(name: 'Julius',                         style: 'APA',            manufacturer: 'Tree House')
# Beer.create(name: 'Bourbon County Coffee Stout',    style: 'Imperial Stout', manufacturer: 'Goose Island')
# Beer.create(name: 'Kentucky Brunch Brand Stout',    style: 'Imperial Stout', manufacturer: 'Toppling Goliath')
# Beer.create(name: 'Pliny The Younger',              style: 'Imperial IPA',   manufacturer: 'Russian River')
# Beer.create(name: 'Heady Topper',                   style: 'Imperial IPA',   manufacturer: 'Russian River')
require 'faker'

@beers = 69
@reviews_per_beer = 100

@beers.times do |c|
  Beer.create(
    name: Faker::Beer.name,
    style: Faker::Beer.style,
    manufacturer: Faker::Company.name
  )
end

@i = 0
while @i <= 50 do
  @reviews_per_beer.times do
    Review.create(
      beer_id: @i,
      manufacturer: Faker::Company.name,
      name: Faker::Beer.name,
      location: Faker::Address.postcode,
      price: Faker::Number.between(10, 150),
      rating: Faker::Number.between(1, 5),
      body: Faker::Lorem.paragraph(3, true, 3),
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
    )
  end
  @i += 1
end

