# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Beer.create(name: 'Pliny The Elder',                style: 'Imperial IPA',   manufacturer: 'Russian River')
Beer.create(name: 'Julius',                         style: 'APA',            manufacturer: 'Tree House')
Beer.create(name: 'Bourbon County Coffee Stout',    style: 'Imperial Stout', manufacturer: 'Goose Island')
Beer.create(name: 'Kentucky Brunch Brand Stout',    style: 'Imperial Stout', manufacturer: 'Toppling Goliath')
Beer.create(name: 'Pliny The Younger',              style: 'Imperial IPA',   manufacturer: 'Russian River')
Beer.create(name: 'Heady Topper',                   style: 'Imperial IPA',   manufacturer: 'Russian River')

