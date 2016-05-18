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

beers = 10
reviews_per_beer = 30
end_date = '5/1/2016'
start_date = '1/1/2015'

Beer.transaction do
  beers.times do |c|
    Beer.create! do |beer|
      beer.name = Faker::Beer.name
      beer.style = Faker::Beer.style
      beer.manufacturer = Faker::Company.name

      review_graph_offset = rand * 2*Math::PI
      review_oscilations  = rand*2.25 + 0.75 # 0.75-3.0

      reviews_per_beer.times do |review_count|
        review_percentage = 1.0*review_count/reviews_per_beer
        price_fluctuation = review_graph_offset + review_oscilations*review_percentage * 2*Math::PI

        beer.reviews.build manufacturer: Faker::Company.name,
                           name:         Faker::Beer.name,
                           # review_date: Faker::Date.between(1.year.ago, Date.today),
                           location:     Faker::Address.postcode,
                           price:        Math.sin(price_fluctuation)*65+85 + rand*50-25,
                           rating:       Faker::Number.between(1, 5),
                           body:         Faker::Lorem.paragraph(3, true, 3),
                           latitude:     41.8869934 + (rand*0.2 - 0.1),
                           longitude:    -87.63298569999999 - (rand*0.2),
                           review_date:  (365*review_percentage).to_i.days.ago
      end
    end
  end
end
