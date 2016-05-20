# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Beer.create(name: 'Zombie Dust', style: 'American Pale Ale', manufacturer: 'Three Floyds',
#             description: 'This intensely hopped and gushing undead Pale Ale will be one’s
#                           only respite after the zombie apocalypse. Created with our marvelous
#                           friends in the comic industry. Formerly known as Cenotaph: A medium
#                           bodied single hop beer showcasing Citra hops from the Yakima Valley, USA.')

# Beer.create(name: 'Bourbon County Coffee Stout', style: 'Imperial Stout', manufacturer: 'Goose Island',
#             description: '2014 Release - Intelligentsia Zirikana Coffee Beans\n
#                           2013 Release - Intelligentsia "Los Inmortales"\n
#                           2012 Release - Intelligentsia La Tortuga Beans\n
#                           2011 Release - Intelligentsia Anjilanaka Beans\n
#                           2010 Release - Intelligentsia Black Cat Espresso Beans')

# Beer.create(name: 'Heady Topper', style: 'Imperial IPA', manufacturer: 'Russian River',
#             description: 'A double India Pale Ale brewed by The Alchemist in Waterbury, VT. It is
#                           unfiltered and contains 8% ABV, with hints of citrus flavors. Unpasteurized,
#                           it is kept refrigerated by authorized retailers until point of sale. As of
#                           December, 2015, it was rated the fifth best beer in the world by Beer Advocate,
#                           and has been described as "a complex web of genius."')


require 'faker'

beers = 25
reviews_per_beer = 200

Beer.transaction do
  beers.times do |c|
    Beer.create! do |beer|
      beer.name = Faker::Beer.name
      beer.style = Faker::Beer.style
      beer.manufacturer = Faker::Company.name
      beer.description = Faker::Lorem.paragraph(4, true, 3)

      review_graph_offset = rand * 2*Math::PI
      review_oscilations  = rand*2.25 + 0.75 # 0.75-3.0

      reviews_per_beer.times do |review_count|
        review_percentage = 1.0*review_count/reviews_per_beer
        price_fluctuation = review_graph_offset + review_oscilations*review_percentage * 2*Math::PI

        beer.reviews.build manufacturer: Faker::Company.name,
                           name:         Faker::Beer.name,
                           price:        Math.sin(price_fluctuation)*65+85 + rand*50-25,
                           rating:       Faker::Number.between(1, 5),
                           body:         Faker::Lorem.paragraph(3, true, 3),
                           latitude:     41.8869934 + (rand*0.2 - 0.1),
                           longitude:    -87.63298569999999 - (rand*0.2),
                           created_at:  (365*review_percentage).to_i.days.ago
      end
    end
  end
end
